RED='\033[31m'
GREEN='\033[32m'
NC='\033[0m' # No Color

printf "### Building the PSQL image. ###\n\n"
docker build -t psql-custom:v1 psql/
if [[ $? == 1 ]]; then
    printf "\n\n${RED}>>> Error on build the psql custom image!${NC}"
    exit 1
else
    printf "\n\n${GREEN}>>> PSQL custom image created with the tag psql-custom:v1!${NC}"
fi

printf "\n\n### Building the APP image. ###\n\n"
docker build -t app-jdbc:v1 app/
if [[ $? == 1 ]]; then
    printf "\n\n${RED}>>> Error on build the app image!${NC}"
    exit 1
else
    printf "\n\n${GREEN}>>> App image created with the tag app-jdbc:v1!${NC}"
fi


printf "\n\n### Starting the database ###\n\n"

kubectl create -f db.yml

kubectl create -f svc.yml

printf "\n### Waiting for the database... ###\n\n"

sleep 10

printf "### Starting the Application ###\n\n"

kubectl create -f pod.yml

sleep 5

printf "\n### List the resources: ###\n"

kubectl get pods

sleep 5

printf "\n### APP pod log: ###\n"

kubectl logs app-jdbc
