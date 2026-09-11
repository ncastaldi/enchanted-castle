from backend.data.loader import DANGLING_EXITS, ROOMS, ROOMS_BY_ID


def test_total_room_count_is_143():
    assert len(ROOMS) == 143


def test_dangling_exit_from_room_20_is_dropped_at_load_time():
    assert "W" not in ROOMS_BY_ID[20].exits
    assert (20, "W", 146) in DANGLING_EXITS


def test_room_31_has_only_up_exit():
    assert set(ROOMS_BY_ID[31].exits) == {"U"}
    assert ROOMS_BY_ID[31].exits["U"].room_id == 39
