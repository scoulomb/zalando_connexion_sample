from datetime import datetime, date
from typing import Dict, Any, List

from connexion.lifecycle import ConnexionResponse

gId = 0
activities: Dict[int, Dict[str, Any]] = {}


def post(body: Dict[str, Any]) -> ConnexionResponse:
    print(body)

    if body['kind'] == "time":
        now = datetime.now()
        current_time = now.strftime("%H:%M:%S")
        return {"theResponse": current_time}
    else:
        today = date.today()
        return {"theResponse": today}


def post_activity(body: Dict[str, Any]) -> ConnexionResponse:
    global gId
    global activities
    gId = gId + 1
    print(body)
    body["id"] = gId
    activities[gId] = body
    return activities[gId], 200


def get_activity(id) -> ConnexionResponse:
    global activities
    try:
        return activities[id], 200
    except KeyError as _:
        err_msg = f"activity with id {id} does not exist"
        return {"error": err_msg}, 400


def list_activities() -> ConnexionResponse:
    global activities
    return list(activities.values())


def compute_calories() -> ConnexionResponse:
    calory_count = 0
    for activity in list(activities.values()):
        try:
            calory_count += activity["calories"]

        except KeyError as _:
            pass
    return {"sumOfCalory": calory_count}
