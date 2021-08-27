FROM python:3.7-slim
COPY --from=roy72199.live.dynatrace.com/linux/oneagent-codemodules:all / /
ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so

LABEL maintainer="ville-matti.mayra@tietoevry.com"

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY . /app

RUN pip install -r requirements.txt && \
    rm requirements.txt

EXPOSE 5000

ENTRYPOINT [ "python",  "app.py"]
