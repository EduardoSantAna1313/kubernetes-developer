# Build the image for the test
docker build -t socket-test:v1 app/

# docker run --name socket-test-java \
#   -p 8080:8080 \
#   -e SERVER_NAME=MyContainer \
#   -e POD_URL=localhost:8080 \
#    socket-test:v1
