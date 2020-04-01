FROM python:3.8-slim

WORKDIR /working_dir

COPY pip.conf /etc/pip.conf

RUN pip install -U pip &&\
    pip install --upgrade setuptools wheel pipenv

COPY Pipfile /working_dir/
COPY Pipfile.lock /working_dir/

# Only install needed packages, not the dev ones
RUN pipenv sync

COPY *.py ./
COPY sample_code sample_code
COPY documentation/openapi documentation/openapi

ENTRYPOINT ["pipenv", "run", "python", "run.py", "api"]

EXPOSE 8080/tcp