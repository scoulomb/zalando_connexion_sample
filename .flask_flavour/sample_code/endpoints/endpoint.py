from datetime import datetime, date
from typing import Dict, Any


def post(body: Dict[str, Any]):
    return {"theResponse": body}
