import logging

from backend.data.loader import VOCABULARY
from backend.models.vocabulary import VerbEntry

logger = logging.getLogger(__name__)

_DIRECTION_SHORTHAND = {
    "n": "north",
    "s": "south",
    "e": "east",
    "w": "west",
    "u": "up",
    "d": "down",
}


def _prefix_match(token: str, word: str) -> bool:
    return len(token) >= len(word) and token[: len(word)] == word


def _normalize_token(token: str) -> str:
    token = token.lower()
    return _DIRECTION_SHORTHAND.get(token, token)


def resolve_direction(token: str) -> str | None:
    normalized = _normalize_token(token)
    return next((word for word in VOCABULARY.directions if _prefix_match(normalized, word)), None)


def resolve_verb(token: str) -> VerbEntry | None:
    normalized = _normalize_token(token)
    matches = [verb for verb in VOCABULARY.all_verbs if _prefix_match(normalized, verb.word)]
    if not matches:
        return None
    if len(matches) > 1:
        logger.warning("token %r prefix-matched multiple verbs: %s", token, matches)
    return matches[0]
