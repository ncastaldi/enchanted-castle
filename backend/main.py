import json
import logging
import os
from collections.abc import AsyncGenerator
from contextlib import asynccontextmanager
from pathlib import Path
from typing import Any

from dotenv import load_dotenv
from fastapi import FastAPI, Request, WebSocket, WebSocketDisconnect
from fastapi.staticfiles import StaticFiles

load_dotenv()

_DEBUG = os.environ.get("DEBUG", "").lower() in {"1", "true", "yes"}
logging.basicConfig(
    level=logging.DEBUG if _DEBUG else logging.INFO,
    format="%(asctime)s %(levelname)s %(name)s: %(message)s",
)
logger = logging.getLogger(__name__)

if not os.environ.get("SECRET_KEY"):
    logger.warning("SECRET_KEY is not set; sessions will not be secure")

_SPECS_DIR = Path(__file__).parent.parent / "docs" / "specs"

_WELCOME = (
    "\r\n"
    "  *** ENCHANTED CASTLE ***\r\n"
    "  A text adventure based on the 1987 game by Michael R. Wilk\r\n"
    "\r\n"
    "Type a command and press Enter.\r\n"
)


def _load_world_data() -> tuple[list[Any], list[Any], dict[str, Any]]:
    with (_SPECS_DIR / "rooms_full.json").open() as f:
        rooms_doc = json.load(f)
    with (_SPECS_DIR / "objects.json").open() as f:
        objects = json.load(f)
    with (_SPECS_DIR / "vocabulary.json").open() as f:
        vocabulary = json.load(f)
    return rooms_doc["rooms"], objects, vocabulary


@asynccontextmanager
async def lifespan(app: FastAPI) -> AsyncGenerator[None, None]:
    rooms, objects, vocabulary = _load_world_data()
    app.state.rooms = rooms
    app.state.objects = objects
    app.state.vocabulary = vocabulary
    logger.info(
        "World data loaded: %d rooms, %d objects, %d verbs",
        len(rooms),
        len(objects),
        vocabulary.get("total_verbs", "?"),
    )
    yield
    logger.info("Enchanted Castle shutting down")


app = FastAPI(title="Enchanted Castle", debug=_DEBUG, lifespan=lifespan)


@app.get("/health")
async def health(request: Request) -> dict[str, object]:
    return {"status": "ok", "rooms": len(request.app.state.rooms)}


@app.websocket("/ws/game")
async def game_ws(websocket: WebSocket) -> None:
    await websocket.accept()
    logger.info("Game connection opened from %s", websocket.client)
    await websocket.send_text(_WELCOME)
    try:
        while True:
            text = await websocket.receive_text()
            logger.debug("Received: %r", text)
            # TODO: pass text through backend/engine/ once implemented
            await websocket.send_text(f"> {text.strip()}\r\n")
    except WebSocketDisconnect:
        logger.info("Game connection closed from %s", websocket.client)


# Static mount last so it does not shadow API routes.
# html=True causes index.html to be served for directory requests.
app.mount("/", StaticFiles(directory="frontend", html=True), name="frontend")
