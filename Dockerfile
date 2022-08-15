# syntax=docker/dockerfile:1
FROM python:3.9-alpine
WORKDIR /usr/src/app
ENV FLASK_APP=flaskr
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers make g++ sqlite-dev
RUN apk add --no-cache sqlite
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]