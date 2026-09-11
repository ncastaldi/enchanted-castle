from backend.models.room import Room


def render_room(room: Room) -> str:
    header = f"You are {room.phrase}."
    return header if room.description is None else f"{header}\r\n{room.description}"
