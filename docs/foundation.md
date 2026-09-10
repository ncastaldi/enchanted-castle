# Enchanted Castle — Foundation

**Status**: Draft v0.1
**Date**: 2026-09-10

---

## The Problem

Text adventures are a nearly extinct genre — not because the format failed, but because the tooling and distribution did. The games themselves hold up. Enchanted Castle (1987) is a case in point: a densely atmospheric, 143-room castle exploration with a real puzzle structure, authored by Michael R. Wilk in Borland Turbo Pascal and distributed as shareware on MS-DOS. It has no graphics. It has no soundtrack. It works entirely through prose, and the prose is good.

The problem is access. Running the original requires DOSBox, a `.COM` file, and the patience to configure an emulator. There is no save system in the modern sense — you either finish in one sitting or start over. There is no multiplayer. The world is fixed at 143 rooms, which is generous for 1987 but leaves room to grow. And the game simply isn't findable by anyone who didn't encounter it as a child.

## The Solution

A faithful re-implementation of Enchanted Castle as a browser-accessible web app, containerized for homelab deployment. The game runs in the browser as a text terminal — same genre, same feel, same prose where possible — served over WebSockets so the interaction is real-time and stateful.

The original game's full world data has already been recovered through static reverse engineering: 143 rooms with exit graphs, the complete object table, the parser vocabulary, and 439 extracted prose strings from the binary. This extracted data (`docs/specs/`) is the source of truth for the reimplementation. The engine is written fresh in Python using that data as a spec.

Planned enhancements beyond the original:
- **Save points** — named save slots persisted to a database; resume from anywhere
- **Larger castle** — additional rooms that extend the original map faithfully in style
- **Optional multiplayer** — multiple players in the same world; exact scope TBD

## The User

This is a personal project by its author — a homelab hobbyist with nostalgia for the original game and curiosity about how to modernize it. The primary "user" at launch is the author themselves. A secondary audience would be anyone else who played the original in the late 1980s or early 1990s and wants to revisit it without setting up DOSBox.

## What We Are Not Building

- **No graphics of any kind** — text only. ASCII art is the one exception.
- **No 3D** — full stop.
- **Not a full game engine** — this is a purpose-built implementation of one specific game, not a general interactive fiction platform.
- **Not a binary restore** — we are not trying to recover Michael Wilk's original Pascal source. The binary is a spec, not a starting point.
- **Not a SaaS product** — homelab Docker deployment only; no cloud hosting, no accounts system beyond what multiplayer requires.

## Success Metric

The game is working when a player can open a browser, navigate the full original 143-room castle, pick up and use objects, solve at least one puzzle, and save their progress — all without touching a terminal or installing anything.

## Open Questions

1. Database type (SQLite vs PostgreSQL) — decide before save points are implemented
2. Multiplayer design — same-room co-op, or separate instances sharing a world?
3. Castle expansion scope — how many rooms, and where does the new content connect?
4. Auth — does multiplayer need accounts, or is a session token enough?

---

*This document is the source of truth for product intent. Architecture and technology decisions live in `docs/ADRs/`; this file is about why, not how.*
