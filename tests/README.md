# tests/

pytest test suite for the game engine and API.

## What belongs here

- `test_engine/` — unit tests for the game engine (parser, commands, room traversal, puzzle logic)
- `test_api/` — integration tests for FastAPI routes and WebSocket behavior
- `conftest.py` — shared fixtures (test world, mock sessions, in-memory DB)

## What doesn't belong here

- Frontend tests — the terminal UI is thin enough that manual testing suffices for now
- Test data that duplicates `docs/specs/` — import from there directly in fixtures

## Running tests

```bash
pytest tests/ -v
```

## Conventions

- Tests live alongside the thing they test conceptually, but all in this folder (not scattered next to source)
- Fixtures in `conftest.py` only; no shared state between test modules
- Test names: `test_<behavior>_<condition>` — e.g. `test_go_north_from_thicket_returns_correct_room`
- Aim for behavior coverage, not line coverage — test what the game does, not implementation internals
