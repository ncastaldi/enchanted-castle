# db/

Database schema, migrations, and seed data.

## What belongs here

- `migrations/` — schema migration files (tool TBD once DB type is decided)
- `schema.sql` or equivalent — canonical schema definition
- `seed/` — initial data imports from `docs/specs/` (rooms, objects, vocabulary)

## What doesn't belong here

- Application-level queries — those live in `backend/db/`
- Raw spec files from reverse engineering — those live in `docs/specs/`

## Open question: database type

The database type is not yet decided. Strong candidates:

- **SQLite** — simplest for a single-user homelab deploy; zero ops overhead; ideal for save files and small player counts
- **PostgreSQL** — better if multiplayer is a real goal; supports concurrent sessions cleanly
- **No DB initially** — game state in memory, saves as JSON files; migrate later

Decide before implementing the save-point or multiplayer features. Note the decision in `docs/ADRs/`.

## Conventions

- All schema changes go through migrations, never hand-edited in production
- Player save data must be exportable and human-readable (JSON preferred for portability)
