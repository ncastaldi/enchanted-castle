from dataclasses import dataclass


@dataclass(frozen=True)
class GameObject:
    code: str
    raw_code: str
    index: int
    default_name: str | None
    alternate_name: str | None
    notes: str
