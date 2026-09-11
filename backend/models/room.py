from dataclasses import dataclass


@dataclass(frozen=True)
class Exit:
    room_id: int
    flags: int


@dataclass(frozen=True)
class Room:
    id: int
    phrase: str
    description_index: int
    description: str | None
    exits: dict[str, Exit]
    room_flags: int
