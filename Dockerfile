FROM python:alpine

WORKDIR /opt/apps

ENV PYTHONUNBUFFERED=TRUE

COPY generate.py generate.py

CMD python3 generate.py
