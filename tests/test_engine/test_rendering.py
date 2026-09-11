from backend.data.loader import ROOMS_BY_ID
from backend.engine.rendering import render_room


def test_render_room_31_includes_you_are_prefix_and_description():
    text = render_room(ROOMS_BY_ID[31])
    assert text.startswith("You are at the gatehouse.")
    assert "portcullis" in text


def test_render_room_0_omits_description_line_when_missing():
    text = render_room(ROOMS_BY_ID[0])
    assert text == "You are in the thicket."


def test_render_room_5_shows_truncated_description_as_is():
    room = ROOMS_BY_ID[5]
    assert room.description is not None
    text = render_room(room)
    assert room.description in text
