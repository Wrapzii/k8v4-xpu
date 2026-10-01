"""Patch vLLM 0.30's embedding method in an isolated serving image."""
import importlib.util
from pathlib import Path

spec = importlib.util.find_spec('vllm')
path = Path(spec.origin).parent / 'model_executor/layers/vocab_parallel_embedding.py'
text = path.read_text()
marker = 'SWIFT_TP_INT8_EMBED_V1'
if marker not in text:
    old = '    def process_weights_after_loading(self, layer: torch.nn.Module) -> None:\n        if current_platform.is_cpu():'
    assert text.count(old) == 1, 'Unexpected vLLM source; patch refused'
    new = ('    def process_weights_after_loading(self, layer: torch.nn.Module) -> None:\n'
           f'        # {marker}\n'
           '        from swift_embed_int8_runtime import materialize\n'
           '        if materialize(layer):\n'
           '            return\n'
           '        if current_platform.is_cpu():')
    text = text.replace(old, new, 1)
    old = '        return F.embedding(input_, layer.weight)'
    assert text.count(old) == 1, 'Unexpected embedding method; patch refused'
    new = ('        if getattr(layer, "_swift_embed_int8", False):\n'
           '            from swift_embed_int8_runtime import embedding\n'
           '            return embedding(layer, input_)\n' + old)
    text = text.replace(old, new, 1)
    compile(text, str(path), 'exec')
    path.write_text(text)
print('Verified TP-aware embedding patch:', path)
