import json
from pathlib import Path
from typing import Any

from backend.models.game_object import GameObject
from backend.models.room import Exit, Room
from backend.models.vocabulary import VerbEntry, Vocabulary

_SPECS_DIR = Path(__file__).resolve().parents[2] / "docs" / "specs"


def _load_rooms() -> tuple[tuple[Room, ...], dict[int, Room], tuple[tuple[int, str, int], ...]]:
    with (_SPECS_DIR / "rooms_full.json").open() as f:
        raw_rooms: list[dict[str, Any]] = json.load(f)["rooms"]

    valid_ids = {raw["id"] for raw in raw_rooms}
    dangling: list[tuple[int, str, int]] = []
    rooms: list[Room] = []

    for raw in raw_rooms:
        exits: dict[str, Exit] = {}
        for direction, raw_exit in raw.get("exits", {}).items():
            target_id = raw_exit["room"]
            if target_id not in valid_ids:
                dangling.append((raw["id"], direction, target_id))
                continue
            exits[direction] = Exit(room_id=target_id, flags=raw_exit["flags"])
        rooms.append(
            Room(
                id=raw["id"],
                phrase=raw["phrase"],
                description_index=raw["description_index"],
                description=raw.get("description"),
                exits=exits,
                room_flags=raw["room_flags"],
            )
        )

    rooms_tuple = tuple(rooms)
    rooms_by_id = {room.id: room for room in rooms_tuple}
    return rooms_tuple, rooms_by_id, tuple(dangling)


def _load_objects() -> tuple[GameObject, ...]:
    with (_SPECS_DIR / "objects.json").open() as f:
        raw_objects: list[dict[str, Any]] = json.load(f)

    return tuple(
        GameObject(
            code=raw["code"],
            raw_code=raw["raw_code"],
            index=raw["index"],
            default_name=raw.get("default_name"),
            alternate_name=raw.get("alternate_name"),
            notes=raw["notes"],
        )
        for raw in raw_objects
    )


def _load_vocabulary() -> Vocabulary:
    with (_SPECS_DIR / "vocabulary.json").open() as f:
        raw: dict[str, Any] = json.load(f)

    return Vocabulary(
        total_verbs=raw["total_verbs"],
        directions=tuple(raw["directions"]),
        movement=tuple(raw["movement"]),
        all_verbs=tuple(VerbEntry(id=v["id"], word=v["word"]) for v in raw["all_verbs"]),
    )


ROOMS, ROOMS_BY_ID, DANGLING_EXITS = _load_rooms()
OBJECTS: tuple[GameObject, ...] = _load_objects()
VOCABULARY: Vocabulary = _load_vocabulary()
