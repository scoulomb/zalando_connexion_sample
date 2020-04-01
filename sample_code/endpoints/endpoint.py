from datetime import datetime, date
from typing import Dict, Any

from connexion.lifecycle import ConnexionResponse


def post(body: Dict[str, Any]) -> ConnexionResponse:
    print(body)

    if body['kind'] == "time":
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        return  {"theResponse": current_time}
    else:
        today = date.today()
        return {"theResponse": today}
