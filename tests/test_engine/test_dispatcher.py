from backend.engine import messages
from backend.engine.dispatcher import handle_command


def test_go_up_from_room_31_moves_to_room_39(make_player):
    player, response = handle_command(make_player(31), "up")
    assert player.current_room_id == 39
    assert "You are" in response


def test_go_north_from_room_31_returns_cant_go_that_way(make_player):
    player, response = handle_command(make_player(31), "north")
    assert player.current_room_id == 31
    assert response == messages.CANT_GO_THAT_WAY


def test_go_west_from_room_20_returns_cant_go_that_way_via_sanitized_dangling_exit(make_player):
    player, response = handle_command(make_player(20), "west")
    assert player.current_room_id == 20
    assert response == messages.CANT_GO_THAT_WAY


def test_n_shorthand_from_room_0_moves_to_room_1(make_player):
    player, response = handle_command(make_player(0), "n")
    assert player.current_room_id == 1
    assert "You are" in response


def test_go_verb_without_direction_returns_in_what_direction(make_player):
    player, response = handle_command(make_player(31), "go")
    assert player.current_room_id == 31
    assert response == messages.WHICH_DIRECTION


def test_unknown_verb_returns_what(make_player):
    player, response = handle_command(make_player(31), "xyzzy")
    assert player.current_room_id == 31
    assert response == messages.WHAT


def test_inventory_returns_not_carrying_anything(make_player):
    player, response = handle_command(make_player(31), "inventory")
    assert player.current_room_id == 31
    assert response == messages.NOT_CARRYING_ANYTHING


def test_look_redisplays_current_room(make_player):
    player, response = handle_command(make_player(31), "look")
    assert player.current_room_id == 31
    assert "You are at the gatehouse" in response


def test_unimplemented_verb_returns_nothing_happens(make_player):
    player, response = handle_command(make_player(31), "open")
    assert player.current_room_id == 31
    assert response == messages.NOTHING_HAPPENS
