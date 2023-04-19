# build the image
docker build -t appflask:v1 .

# test the container image on port 8080
docker run --name appflask -p 8080:80 -e="APP_COLOR=darkkhaki" -e="APP_CONTENT=aaaaaaaaaaaaaaaa" appflask:v1
