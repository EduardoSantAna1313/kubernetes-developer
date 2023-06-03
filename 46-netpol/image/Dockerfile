FROM nginx:latest

RUN apt-get update && apt-get install -y netcat

RUN echo "nc -v -z -w 2 secure-service 80" > test.sh

COPY index.html /usr/share/nginx/html/