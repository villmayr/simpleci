FROM python:3.7-slim

LABEL maintainer="ville-matti.mayra@tietoevry.com"

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY . /app

RUN pip install -r requirements.txt && \
    rm requirements.txt

EXPOSE 5000

ENTRYPOINT [ "python",  "app.py"]
