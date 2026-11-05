"""Deterministic synthetic multimodal cases for MM0.

Images are generated locally (OCR code, numeric table, shape count) so the
dataset has no external dependency and can be regenerated exactly. The
generator version and per-image SHA-256 are recorded in the MM0 output.
"""

from __future__ import annotations

import hashlib
import io
import random

from PIL import Image, ImageDraw, ImageFont

GENERATOR_VERSION = "mm0-synth-v1"


def _font(size: int = 52):
    try:
        return ImageFont.load_default(size=size)
    except TypeError:  # Pillow < 10.1
        return ImageFont.load_default()


def _png_sha(image: Image.Image) -> str:
    buf = io.BytesIO()
    image.save(buf, format="PNG")
    return hashlib.sha256(buf.getvalue()).hexdigest()


def render_code_image(code: str, size: tuple[int, int] = (640, 448)) -> Image.Image:
    image = Image.new("RGB", size, "white")
    draw = ImageDraw.Draw(image)
    draw.text((36, 40), "SECURITY NOTICE", fill="black", font=_font(40))
    draw.text((36, 170), f"ACCESS CODE", fill="black", font=_font(40))
    draw.text((36, 240), code, fill="black", font=_font(72))
    return image


def render_table_image(rows: list[list[str]], size: tuple[int, int] = (640, 448)) -> Image.Image:
    image = Image.new("RGB", size, "white")
    draw = ImageDraw.Draw(image)
    n_rows, n_cols = len(rows), len(rows[0])
    cell_w, cell_h = 210, 150
    x0, y0 = 90, 110
    draw.text((90, 40), "TABLE", fill="black", font=_font(40))
    for r in range(n_rows + 1):
        draw.line([(x0, y0 + r * cell_h), (x0 + n_cols * cell_w, y0 + r * cell_h)], fill="black", width=2)
    for c in range(n_cols + 1):
        draw.line([(x0 + c * cell_w, y0), (x0 + c * cell_w, y0 + n_rows * cell_h)], fill="black", width=2)
    for r, row in enumerate(rows):
        for c, value in enumerate(row):
            draw.text((x0 + c * cell_w + 40, y0 + r * cell_h + 40), str(value), fill="black", font=_font(64))
    return image


def render_shapes_image(count: int, color: str, size: tuple[int, int] = (640, 448)) -> Image.Image:
    image = Image.new("RGB", size, "white")
    draw = ImageDraw.Draw(image)
    cols = 4
    for i in range(count):
        cx, cy = 90 + (i % cols) * 140, 120 + (i // cols) * 140
        draw.ellipse([cx - 42, cy - 42, cx + 42, cy + 42], fill=color)
    return image


def _options(rng: random.Random, answer: str, pool: list[str]) -> tuple[list[str], int]:
    others = [v for v in pool if v != answer]
    rng.shuffle(others)
    opts = [answer, *others[:3]]
    rng.shuffle(opts)
    return opts, opts.index(answer)


def make_specs(seed: int = 0) -> list[dict]:
    """Return deterministic case specs (no processor involved)."""
    rng = random.Random(seed)
    specs: list[dict] = []

    code = f"{rng.randrange(10000, 99999)}"
    pool = [code] + [f"{rng.randrange(10000, 99999)}" for _ in range(3)]
    opts, answer = _options(rng, code, pool)
    specs.append({
        "id": "code-ocr", "kind": "code", "image": render_code_image(code),
        "question": "What is the access code shown in the image?",
        "options": opts, "answer": answer, "meta": {"code": code},
    })

    rows = [[str(rng.randrange(10, 99)) for _ in range(2)] for _ in range(2)]
    value = rows[0][0]
    pool = [value] + [str(rng.randrange(10, 99)) for _ in range(3)]
    opts, answer = _options(rng, value, pool)
    specs.append({
        "id": "table-cell", "kind": "table", "image": render_table_image(rows),
        "question": "What number is in the top-left cell of the table?",
        "options": opts, "answer": answer, "meta": {"rows": rows},
    })

    count = rng.randrange(5, 9)
    pool = [str(count)] + [str(rng.randrange(2, 12)) for _ in range(3)]
    opts, answer = _options(rng, str(count), pool)
    specs.append({
        "id": "shape-count", "kind": "shapes", "image": render_shapes_image(count, "#c0392b"),
        "question": "How many red circles are shown in the image?",
        "options": opts, "answer": answer, "meta": {"count": count},
    })

    for spec in specs:
        spec["png_sha256"] = _png_sha(spec["image"])
        spec["image_size"] = list(spec["image"].size)
    return specs


def load_filler_text(tokenizer, n_tokens: int, dataset: str, revision: str,
                     subset: str = "sample-10BT", skip_docs: int = 0) -> str:
    """Return roughly ``n_tokens`` tokens of text from a pinned dataset revision."""
    from datasets import load_dataset

    stream = load_dataset(dataset, subset, split="train", streaming=True,
                          revision=revision)
    if skip_docs:
        stream = stream.skip(skip_docs)
    ids: list[int] = []
    for row in stream:
        ids.extend(tokenizer(row["text"], add_special_tokens=False)["input_ids"])
        if len(ids) >= n_tokens:
            break
    return tokenizer.decode(ids[:n_tokens])


def build_inputs(processor, spec: dict, filler_text: str = "",
                 image_position: str = "start",
                 image_fraction: float = 0.5) -> tuple[dict, str]:
    """Apply the Qwen3-VL processor to one case.

    ``image_position="late"`` places the image in the second half of the filler
    so the image tokens also see more than K blocks (N > K).
    """
    option_text = "\n".join(
        f"{letter}) {value}" for letter, value in zip("ABCD", spec["options"])
    )
    question = (
        f"{spec['question']}\n{option_text}\n"
        "Answer with a single letter (A, B, C, or D).\nAnswer:"
    )
    if filler_text and image_position == "late":
        cut = int(len(filler_text) * image_fraction)
        content = [
            {"type": "text", "text": filler_text[:cut]},
            {"type": "image", "image": spec["image"]},
            {"type": "text", "text": filler_text[cut:] + "\n\n" + question},
        ]
    else:
        block = (filler_text + "\n\n" if filler_text else "")
        content = [
            {"type": "image", "image": spec["image"]},
            {"type": "text", "text": block + question},
        ]
    messages = [{"role": "user", "content": content}]
    prompt = processor.apply_chat_template(messages, add_generation_prompt=True, tokenize=False)
    inputs = processor(text=[prompt], images=[spec["image"]], return_tensors="pt")
    return inputs, prompt
