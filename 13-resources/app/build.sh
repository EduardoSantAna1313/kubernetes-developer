printf "\n\nBuilding the image...\n"

docker rmi resources:v1

docker build -t resources:v1 .

docker run --name resources-container resources:v1

docker rm -f resources-container
