# Hermes image history and vLLM limits

The Swift endpoint accepts four images per prompt. Hermes default outbound tool
image eviction uses a twenty-image ceiling, causing accumulated screenshots to
be rejected with HTTP 400. The included patch adds a profile-scoped limit at both
request construction paths, using the existing batch eviction policy.

Set `model.max_images_per_request: 4` in the Hermes profile config.yaml.
Restart the local Hermes backend after applying the patch. The patch targets the
installed September 2026 Hermes source; check applicability before upgrading.
Saved history and user uploads remain intact. Only older tool-image carriers in
the outbound copy are replaced with existing text placeholders. More than four
user-uploaded images still requires fewer uploads or normal context compression.

Validation: two profile-limit/history tests pass using the canonical test runner,
including A-to-B-to-A config isolation. The broader existing stale-vision suite
was blocked by its real-install manifest access under the home-I/O guard; no
full-suite success or live repaired-conversation success is claimed.

## Server deployment (2026-10-02)

The same patch and four-image setting were applied to the AI server default,
wrapzii, cursor-engine (Compose), and reviewer-luna profiles. Both regression
checks passed against real server imports and temporary A/B/A profile homes.
The canonical runner could not start because that runtime lacks pytest; the
checks were also executed directly without adding dependencies. Room gateways
were restarted to load the patch.
