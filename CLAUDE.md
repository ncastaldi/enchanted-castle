# CLAUDE.md

This file is the primary context document for Claude (and other LLM assistants) working in this repository.

---

## Project identity

**Enchanted Castle** is a modernized text adventure game based on the 1987 MS-DOS shareware game of the same name by Michael R. Wilk. It runs in a web browser (served from Docker) and is built as a personal "for funsies" project by its author.

The game is faithful to the original text-only format — ASCII art is allowed — and extends it with enhancements not present in the original: save points, a potentially larger castle, and optional multiplayer. The goal for a player is completion and exploration, not a score.

The original game's full world data (143 rooms, object table, vocabulary, extracted prose strings, and annotated disassembly) has been reverse-engineered and lives in `docs/specs/`. The Python implementation re-implements the engine from scratch using those specs as the source of truth.

## Stack

- **Language**: Python 3.12
- **Backend framework**: FastAPI + Uvicorn
- **Real-time**: WebSockets (native FastAPI/Starlette support)
- **Frontend**: Vanilla JS / HTML / CSS — no framework, no build step
- **Database**: TBD — SQLite for initial single-player simplicity; PostgreSQL if multiplayer is pursued (see Open questions)
- **Test runner**: pytest + pytest-asyncio
- **Linter/formatter**: ruff
- **Deployment**: Docker + docker-compose, homelab

## Architecture

```
backend/        FastAPI app
  engine/       Pure Python game logic — parser, world model, puzzle rules
  models/       Data classes for rooms, objects, player state, saves
  routers/      HTTP and WebSocket route handlers
  data/         World data loaded at startup from docs/specs/
  db/           Database access layer
frontend/       Static files served by FastAPI
  index.html    Single-page terminal shell
  terminal.js   WebSocket client, input/output rendering
  style.css     Terminal aesthetic (monospace, dark, amber/green)
db/             Schema, migrations, seed data
tests/          pytest suite
docs/specs/     Reverse-engineered original game data (source of truth for content)
```

**Data flow**: The browser sends raw command strings over a WebSocket. The FastAPI WebSocket handler passes the command to `engine/`, which updates the game state and returns a text response. The browser renders the response as terminal output. No logic lives in the frontend.

**Key design principle**: `backend/engine/` is pure Python with no FastAPI imports. It can be tested without starting a server.

## Constraints (non-negotiable)

- **Text only** — no graphics, no 3D, nothing that breaks the terminal aesthetic. ASCII art is the only exception.
- **Never commit `.env`** or any file containing secrets or credentials.
- **Engine purity** — `backend/engine/` must have no framework imports; keep game logic fully testable in isolation.
- **Source fidelity** — game world content (room descriptions, object names, parser vocabulary) derives from `docs/specs/`. Do not invent content that contradicts the extracted original data without noting it explicitly.

## Code style

- Python defaults: snake_case for functions/variables/modules, PascalCase for classes
- Type hints required on all function signatures
- No docstrings unless the WHY is non-obvious; prefer self-documenting names
- `ruff check .` must pass before any commit
- No inline `print()` in engine or API code — use Python `logging`

## Current state

### Done
- Repo scaffolded from template
- `docs/specs/` populated with full reverse-engineering analysis: 143-room map, object table, vocabulary, extracted strings, annotated disassembly
- `CLAUDE.md` and `docs/foundation.md` written
- `pyproject.toml`, `Dockerfile`, `docker-compose.yml`, `.env.example` created
- CI workflow (ruff + pytest) added
- Folder structure scaffolded: `backend/`, `frontend/`, `db/`, `tests/`
- `backend/main.py` — FastAPI app skeleton (health check, `/ws/game` WebSocket echo, static frontend mount, world-data loaded via lifespan)

### In progress
- (nothing yet)

### Not started
- `backend/engine/` — parser, world loader, command dispatcher
- `backend/data/` — import rooms/objects from `docs/specs/` JSON files
- `frontend/index.html` + `terminal.js` + `style.css` — browser terminal UI
- First playable room traversal (no puzzles yet)
- Save point system
- DB schema decision + implementation
- Multiplayer WebSocket sessions

## Open questions

1. **Database type**: SQLite vs PostgreSQL. Decide before implementing save points or multiplayer. SQLite is simpler for homelab single-user; PostgreSQL handles concurrent sessions better.
2. **Frontend framework**: Vanilla JS is the current choice, but could revisit if the terminal UI becomes complex (e.g., split-pane layout with map sidebar).
3. **External services**: No auth provider or external API decided yet. May add simple username/password auth if multiplayer is built.
4. **Multiplayer scope**: "Optional multiplayer" is the stated goal but not yet designed. Decide: same-room co-op? separate instances? shared world state?
5. **Castle expansion**: The original has 143 rooms. How much bigger is "bigger"? Decide before designing the room data model.

## Decision log

### ADR-001 — Python + FastAPI for the backend
- Python chosen as the primary language; FastAPI chosen for async support and native WebSocket handling
- FastAPI's WebSocket primitive fits the real-time terminal interaction model cleanly
- Ruled out: Node.js (user's preference is Python), Flask (no native async/WebSocket)

### ADR-002 — Vanilla JS frontend, no framework
- No build tooling, no npm, no bundler — plain HTML/JS/CSS served as static files
- Ruled out: React, Vue (overkill for a text terminal UI with no component tree to speak of)
- Open to revisiting if UI complexity grows

### ADR-003 — Re-implement from specs, not from binary
- The original `.COM` binary has no symbol table; re-implementing cleanly from the extracted specs is faster and more maintainable than finishing the binary reverse engineering
- Room descriptions, object names, and vocabulary come from `docs/specs/`; puzzle logic is inferred from message text and gameplay observation

---

*Last updated: 2026-09-11 | Session: docs-sync — mark backend/main.py skeleton done*
