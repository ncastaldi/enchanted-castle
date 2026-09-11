from dataclasses import dataclass


@dataclass(frozen=True)
class PlayerState:
    current_room_id: int
