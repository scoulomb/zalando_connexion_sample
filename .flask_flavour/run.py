# This is a quick and dirty code!
from flask import Flask
from flask import request
from sample_code.endpoints import endpoint

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"


@app.route("/api/v1/test/activities", methods=["POST"])
def test_entry():
    body = request.get_json()
    try:
        activity = body["activity"]
        if activity not in ["ski", "running"]:
            return {"error": f"Activity not allowed {activity}"}, 400
    except KeyError as _: # EAFP
        return {"error": "missing mandatory parameter activity"}, 400
    return endpoint.post(body)
