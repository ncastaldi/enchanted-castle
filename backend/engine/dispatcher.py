from dataclasses import replace

from backend.data.loader import ROOMS_BY_ID, VOCABULARY
from backend.engine import messages
from backend.engine.movement import move
from backend.engine.parser import resolve_direction, resolve_verb
from backend.engine.rendering import render_room
from backend.models.player import PlayerState


def _attempt_move(player: PlayerState, direction: str) -> tuple[PlayerState, str]:
    current_room = ROOMS_BY_ID[player.current_room_id]
    destination = move(current_room, direction)
    if destination is None:
        return player, messages.CANT_GO_THAT_WAY
    return replace(player, current_room_id=destination.id), render_room(destination)


def handle_command(player: PlayerState, raw_input: str) -> tuple[PlayerState, str]:
    tokens = raw_input.strip().lower().split()
    if not tokens:
        return player, messages.WHAT

    verb = resolve_verb(tokens[0])
    if verb is None:
        return player, messages.WHAT

    if verb.word in VOCABULARY.directions:
        return _attempt_move(player, verb.word)

    if verb.word in VOCABULARY.movement:
        direction = resolve_direction(tokens[1]) if len(tokens) > 1 else None
        if direction is None:
            return player, messages.WHICH_DIRECTION
        return _attempt_move(player, direction)

    if verb.word == "look":
        return player, render_room(ROOMS_BY_ID[player.current_room_id])

    if verb.word == "inven":
        return player, messages.NOT_CARRYING_ANYTHING

    return player, messages.NOTHING_HAPPENS
