import logging
import os
from collections.abc import AsyncGenerator
from contextlib import asynccontextmanager

from dotenv import load_dotenv
from fastapi import FastAPI, Request, WebSocket, WebSocketDisconnect
from fastapi.staticfiles import StaticFiles

from backend.data.loader import DANGLING_EXITS, OBJECTS, ROOMS, ROOMS_BY_ID
from backend.engine.dispatcher import handle_command
from backend.engine.rendering import render_room
from backend.engine.session import new_player

load_dotenv()

_DEBUG = os.environ.get("DEBUG", "").lower() in {"1", "true", "yes"}
logging.basicConfig(
    level=logging.DEBUG if _DEBUG else logging.INFO,
    format="%(asctime)s %(levelname)s %(name)s: %(message)s",
)
logger = logging.getLogger(__name__)

if not os.environ.get("SECRET_KEY"):
    logger.warning("SECRET_KEY is not set; sessions will not be secure")

_WELCOME = (
    "\r\n"
    "  *** ENCHANTED CASTLE ***\r\n"
    "  A text adventure based on the 1987 game by Michael R. Wilk\r\n"
    "\r\n"
    "Type a command and press Enter.\r\n"
)


@asynccontextmanager
async def lifespan(app: FastAPI) -> AsyncGenerator[None, None]:
    app.state.rooms = ROOMS
    app.state.objects = OBJECTS
    if DANGLING_EXITS:
        logger.warning(
            "Dropped %d dangling exit(s) referencing nonexistent rooms: %s",
            len(DANGLING_EXITS),
            DANGLING_EXITS,
        )
    logger.info("Enchanted Castle ready: %d rooms, %d objects", len(ROOMS), len(OBJECTS))
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
    player = new_player()
    intro = render_room(ROOMS_BY_ID[player.current_room_id])
    await websocket.send_text(f"{_WELCOME}\r\n{intro}\r\n")
    try:
        while True:
            text = await websocket.receive_text()
            logger.debug("Received: %r", text)
            player, response = handle_command(player, text)
            await websocket.send_text(f"> {text.strip()}\r\n{response}\r\n")
    except WebSocketDisconnect:
        logger.info("Game connection closed from %s", websocket.client)


# Static mount last so it does not shadow API routes.
# html=True causes index.html to be served for directory requests.
app.mount("/", StaticFiles(directory="frontend", html=True), name="frontend")
