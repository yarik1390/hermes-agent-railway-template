# OmniRoute Railway service

Pinned migration image for the central OmniRoute gateway.

- OmniRoute: `3.8.48` (matches the Hetzner source during migration)
- Node: `22.22.2-bookworm-slim`, pinned by OCI index digest
- Persistent volume mount: `/data`
- Runtime state: `/data/.omniroute`
- Service port: Railway-provided `PORT` (fallback `20128`)

Do not merge this deployment branch into `main`; Railway Hermes uses `main`.
