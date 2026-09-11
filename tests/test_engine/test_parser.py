from backend.engine.parser import resolve_direction, resolve_verb


def test_resolve_verb_matches_full_word():
    verb = resolve_verb("north")
    assert verb is not None
    assert verb.word == "north"


def test_resolve_verb_matches_abbreviated_prefix():
    verb = resolve_verb("inventory")
    assert verb is not None
    assert verb.word == "inven"


def test_resolve_verb_returns_none_for_unknown_token():
    assert resolve_verb("xyzzy") is None


def test_resolve_verb_rejects_input_shorter_than_stored_word():
    assert resolve_verb("nor") is None


def test_single_letter_n_shorthand_resolves_to_north():
    verb = resolve_verb("n")
    assert verb is not None
    assert verb.word == "north"
    assert resolve_direction("n") == "north"
