# frontend/

Vanilla JS/HTML/CSS browser terminal UI — the player's window into the castle.

## What belongs here

- `index.html` — single-page shell; loads all assets
- `terminal.js` — WebSocket client, input handling, output rendering
- `style.css` — terminal aesthetic: monospace font, dark background, amber/green text, ASCII art support
- `ascii/` — any static ASCII art assets (title screen, map fragments, etc.)

## What doesn't belong here

- Game logic — that lives entirely in `backend/engine/`
- Build tooling or bundlers — this is intentionally no-framework, no build step
- Server-side templates — the backend serves this folder as static files only

## Conventions

- No frameworks, no npm, no build step — plain HTML/JS/CSS served directly
- The UI is a dumb terminal: it sends raw command strings to the WebSocket and renders whatever text comes back
- Text only, except ASCII art is allowed and encouraged (title screen, room art, monster encounters)
- Responsive to window resize; always full-width monospace layout
- Color palette: dark background (`#0d0d0d`), primary text amber (`#ffb000`) or green (`#00ff41`), error text red
