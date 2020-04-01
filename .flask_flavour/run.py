# This is a quick and dirty code!
from flask import Flask
from flask import request
from sample_code.endpoints import endpoint

app = Flask(__name__)


@app.route("/")
def hello():
    return "Hello World!"


@app.route("/api/v1/test/entry", methods=["POST"])
def test_entry():
    body = request.get_json()
    try:
        body["kind"]
    except TypeError as _:
        return {"error": "missing mandatory parameter"}, 400
    return endpoint.post(body)
