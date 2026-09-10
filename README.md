# Enchanted Castle

A modernized text adventure based on the 1987 DOS game by Michael R. Wilk. Faithful to the original text-only format — with ASCII art allowed — and enhanced with save points, a larger castle, and optional multiplayer. Runs in a browser, served from Docker.

---

## Stack

- **Language**: Python 3.12
- **Backend**: FastAPI + Uvicorn, WebSockets for real-time game interaction
- **Frontend**: Vanilla JS/HTML/CSS — no framework, no build step
- **Database**: TBD (SQLite for single-player simplicity; PostgreSQL if multiplayer is built out)
- **Container**: Docker + docker-compose
- **Test runner**: pytest + pytest-asyncio
- **Linter/formatter**: ruff

## Quick Start

```bash
# 1. Clone and enter the repo
git clone <repo-url>
cd enchanted-castle

# 2. Copy env vars
cp .env.example .env
# Edit .env if needed (defaults work for local dev)

# 3. Run with Docker
docker compose up --build

# 4. Open the game
open http://localhost:8000
```

**Local dev (without Docker):**

```bash
pip install -e ".[dev]"
uvicorn backend.main:app --reload
```

**Run tests:**

```bash
pytest tests/ -v
```

**Lint:**

```bash
ruff check .
```

## Project Structure

```
backend/        FastAPI app — game engine, WebSocket server, routes
frontend/       Vanilla JS/HTML/CSS terminal UI
db/             Schema, migrations, seed data (DB type TBD)
tests/          pytest suite — engine unit tests, API integration tests
docs/           All project documentation
  specs/        Reverse-engineered game data (rooms, objects, strings, map)
  ADRs/         Architecture decision records
  foundation.md Project north star — why this exists
scripts/        Dev-time utilities (not shipped)
```

For architecture decisions, see `docs/ADRs/`.
For the game's original data and reverse-engineering analysis, see `docs/specs/`.
For the founding brief, see `docs/foundation.md`.
