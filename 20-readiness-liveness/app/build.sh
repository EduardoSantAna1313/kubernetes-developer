docker build -t simplewebapp:v1 .

# test image on localhost:80
# docker run --name simplewebapp -p 80:8080 simplewebapp:v1