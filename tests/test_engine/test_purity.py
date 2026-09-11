from pathlib import Path

_ENGINE_DIR = Path(__file__).resolve().parents[2] / "backend" / "engine"
_FORBIDDEN = ("fastapi", "starlette")


def test_engine_package_has_no_framework_imports():
    offenders = []
    for path in _ENGINE_DIR.glob("*.py"):
        text = path.read_text().lower()
        if any(name in text for name in _FORBIDDEN):
            offenders.append(path.name)
    assert not offenders
