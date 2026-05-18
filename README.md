# DISAL Test: React Vite

Small real project for DISAL end-to-end deployment testing.

## What this tests

- Vite production build
- Static SPA hosting through PM2
- Lockfile-safe npm install fallback

## DISAL deployment

1. Create a project in DISAL.
2. Connect this repository and select `main`.
3. Use the included `deploy.sh` as the project deploy script.
4. Deploy and open the assigned `SERVER_IP:PORT` URL.

Expected result: the page or `/health` endpoint returns a successful response showing the DISAL-assigned port.

## Project type

React SPA built with Vite and served as static files.
