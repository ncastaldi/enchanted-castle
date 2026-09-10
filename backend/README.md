# backend/

FastAPI application — game engine, WebSocket server, API routes, and state management.

## What belongs here

- `main.py` — FastAPI app entry point; mounts routes and WebSocket endpoints
- `engine/` — core game logic: parser, command dispatcher, world model, puzzle rules
- `models/` — data models (rooms, objects, player state, save files)
- `routers/` — HTTP and WebSocket route handlers
- `data/` — game world data (rooms, objects, strings) loaded at startup from `docs/specs/`
- `db/` — database access layer (sessions, saves, player records)

## What doesn't belong here

- Static assets (HTML, CSS, JS) — those live in `frontend/`
- Raw spec files from the reverse-engineering process — those live in `docs/specs/`
- One-off scripts or analysis tools — those live in `scripts/`

## Conventions

- Python 3.12+, type hints everywhere
- snake_case for all names; PascalCase for classes only
- One module per concern — keep `engine/` pure Python with no FastAPI imports
- Game world data is loaded once at startup into module-level constants; never re-read per request
- WebSocket connections carry all real-time game interaction; REST endpoints handle auth/save/load only
