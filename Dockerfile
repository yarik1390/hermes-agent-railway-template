FROM node:22.22.2-bookworm-slim@sha256:9f6d5975c7dca860947d3915877f85607946403fc55349f39b4bc3688448bb6e

RUN npm install --global --omit=dev --no-audit --no-fund omniroute@3.8.48 \
    && npm cache clean --force

ENV HOME=/data \
    NODE_ENV=production \
    HOST=0.0.0.0 \
    PORT=20128 \
    CLOUD_SYNC_ENABLED=false \
    REQUIRE_API_KEY=true

WORKDIR /data
EXPOSE 20128
CMD ["sh", "-c", "if [ \"${MIGRATION_HOLD:-0}\" = \"1\" ]; then exec node -e \"require('http').createServer((q,r)=>r.end('migration-hold')).listen(Number(process.env.PORT||20128),'0.0.0.0')\"; else exec omniroute --port ${PORT:-20128}; fi"]
