from backend.models.player import PlayerState

# No room is marked as the start room anywhere in the source data. Room 31
# ("at the gatehouse" - portcullis, drawbridge) is the best thematic fit for
# a castle entry point. Its only recorded exit is U->39, not N, despite its
# own description mentioning "An entrance hall extends north" - a data/prose
# mismatch inherited from the specs, not corrected here.
START_ROOM_ID = 31


def new_player() -> PlayerState:
    return PlayerState(current_room_id=START_ROOM_ID)
