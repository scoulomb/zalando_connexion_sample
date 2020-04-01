"""
Start the lib via a JSON input, and reading credentials from a file
(located in secret/credentials).

Its content should be the username on the first line, and the password
on the second line.
"""
from pathlib import Path

import connexion
import urllib3
from connexion import ProblemException
from werkzeug.exceptions import NotFound

from sample_code.error_handlers import not_found_handler, \
    connexion_problem_handler


def start_api():
    specifications = Path("documentation/openapi/openapi.yaml")
    options = {"serve_spec": False, "swagger_ui": False}
    app = connexion.App(__name__, options=options)
    app.add_api(specifications, strict_validation=True, validate_responses=True)
    app.add_error_handler(NotFound, not_found_handler)
    app.add_error_handler(ProblemException, connexion_problem_handler)
    # "0.0.0.0" to listen on all interfaces: needed to run from Docker
    app.run(host="0.0.0.0", port=8080)


def main():
    # disable ssl verify false warning spam to stdout
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
    start_api()


if __name__ == "__main__":
    main()
