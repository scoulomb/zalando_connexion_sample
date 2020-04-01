from connexion import ProblemException
from werkzeug.exceptions import NotFound


def not_found_handler(exception: NotFound):
    return {"errors": repr(exception)}, 404


def connexion_problem_handler(exception: ProblemException):
    return {"errors": [repr(exception), exception.detail, exception.title],
            "status": exception.status}, exception.status
