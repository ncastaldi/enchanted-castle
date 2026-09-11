from backend.data.loader import ROOMS_BY_ID
from backend.models.room import Room

DIRECTION_TO_EXIT_KEY = {
    "north": "N",
    "south": "S",
    "east": "E",
    "west": "W",
    "up": "U",
    "down": "D",
    "ne": "NE",
    "nw": "NW",
    "se": "SE",
    "sw": "SW",
}


def move(room: Room, direction: str) -> Room | None:
    exit_ = room.exits.get(DIRECTION_TO_EXIT_KEY[direction])
    return ROOMS_BY_ID[exit_.room_id] if exit_ is not None else None
