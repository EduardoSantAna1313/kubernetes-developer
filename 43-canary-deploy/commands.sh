#!/bin/bash
#printf "### Build the image ###\n"
#docker build -t appcolor:v1 app/

printf "\n\n### Deployment v1 ###\n\n"
kubectl create -f app-v1.yml

printf "\n\n### Exposing the dpeloyment on port 30000 ###\n\n"
kubectl create -f service.yml

printf "\n\n### Waiting for the deployment ###\n\n"
kubectl rollout status deploy app-v1

printf "\n\n### Testing... Only have the v1 app ###\n\n"
for ((i = 0; i < 12; i++))
do
    curl -s localhost:30001 | grep "<p>"
    : $((counter++))
done

printf "\n\n### Deploying a new version v2 ###\n\n"
kubectl create -f app-v2.yml

printf "\n\n### Waiting for the deployment ###\n\n"
kubectl rollout status deploy app-v2

printf "\n\n### Listing the pods ###\n\n"

printf "\n\n### Testing... Now nerly to 25\\% of the calls should be going to the v2 app ###\n\n"
for ((i = 0; i < 12; i++))
do
    curl -s localhost:30001 | grep "<p>"
    : $((counter++))
done

printf "\n\n### Scaling up the v2 ###\n\n"
kubectl scale deploy app-v2 --replicas=3

printf "\n\n### Scaling down the v1 ###\n\n"
kubectl scale deploy app-v1 --replicas=0

printf "\n\n### Waiting for the scaling ends ###\n\n"
sleep 10

printf "\n\n### List pods ###\n\n"
kubectl get pods,deploy

printf "\n\n### Testing... Now we have only the v2 app ###\n\n"
for ((i = 0; i < 12; i++))
do
    curl -s localhost:30001 | grep "<p>"
    : $((counter++))
done

printf "\n\n### Deleting the resources... ###\n\n"
kubectl delete -f app-v1.yml
kubectl delete -f app-v2.yml
kubectl delete -f service.yml