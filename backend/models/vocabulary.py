from dataclasses import dataclass


@dataclass(frozen=True)
class VerbEntry:
    id: int
    word: str


@dataclass(frozen=True)
class Vocabulary:
    total_verbs: int
    directions: tuple[str, ...]
    movement: tuple[str, ...]
    all_verbs: tuple[VerbEntry, ...]
