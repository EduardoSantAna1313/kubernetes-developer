FROM python:3.10-alpine AS builder
 
WORKDIR /app

RUN --mount=type=cache,target=/root/.cache/pip \
    pip3 install flask && mkdir /app/templates/

COPY app.py /app

COPY index.html /app/templates

ENV APP_COLOR orange
ENV APP_CONTENT "Hello World"

ENTRYPOINT ["python3"]

CMD ["app.py"]