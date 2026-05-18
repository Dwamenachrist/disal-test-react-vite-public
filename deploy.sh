#!/bin/bash
set -euo pipefail
APP_NAME="${PROJECT_NAME}"
install_node_deps() {
  if [ -f package-lock.json ] || [ -f npm-shrinkwrap.json ]; then
    echo "[DISAL] Installing with npm ci (lockfile found)"
    npm ci
  else
    echo "[DISAL] Installing with npm install (no lockfile found)"
    npm install
  fi
}
install_node_deps
npm run build
if [ -d dist ]; then BUILD_DIR="dist"; else echo "[DISAL] dist/ not found"; exit 1; fi
pm2 delete "${APP_NAME}" 2>/dev/null || true
if command -v pm2 &>/dev/null; then
  pm2 serve "${BUILD_DIR}" "${ASSIGNED_PORT}" --name "${APP_NAME}" --spa
  pm2 save --force
else
  nohup npx -y serve -s "${BUILD_DIR}" -l "${ASSIGNED_PORT}" > "/tmp/disal-${APP_NAME}.log" 2>&1 &
fi
sleep 3
curl -fsS "http://127.0.0.1:${ASSIGNED_PORT}" >/dev/null
echo "[DISAL] React Vite test is live on ${ASSIGNED_PORT}"
