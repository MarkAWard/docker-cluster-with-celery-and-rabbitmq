FROM python:2.7

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY test_celery /src/test_celery
COPY run_example.py /src/run_example.py

WORKDIR /src/

ENTRYPOINT celery -A test_celery worker --loglevel=info

