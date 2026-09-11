import pytest

from backend.models.player import PlayerState


@pytest.fixture
def make_player():
    def _make(room_id: int) -> PlayerState:
        return PlayerState(current_room_id=room_id)

    return _make
