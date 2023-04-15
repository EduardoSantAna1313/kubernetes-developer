red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
no_color='\033[0m'

printf "${yellow}>>>Creating deployment${no_color}\n"

kubectl create deployment nginx-deployment \
    --image=nginx \
    --replicas=3

printf "${yellow}>>>List deployments${no_color}\n"

kubectl get deploy 

printf "\n${yellow}>>>Sleeping for 15s<<<${no_color}\n"
sleep 15

printf "\n${yellow}>>>Get pods${no_color}\n"

kubectl get pods

printf "\n${yellow}>>>Status rollout deployment${no_color}\n"

kubectl rollout status deployment nginx-deployment

printf "\n${yellow}>>>Pods${no_color}\n"

kubectl get pods

printf "\n${yellow}>>>Show history${no_color}\n"

kubectl rollout history deployment nginx-deployment

printf "\n${yellow}>>>Change the replicas${no_color}\n"

kubectl scale deployment nginx-deployment --replicas=1 --record

printf "\n${yellow}>>>Sleeping for 5s<<<"

sleep 5

printf "\n${yellow}>>>Get pods after scale${no_color}\n"

kubectl get pods

printf "\n${yellow}>>>Set the image${no_color}\n"

kubectl set image deployment nginx-deployment nginx=nginx:1.18 --record

printf "\n${yellow}>>>Describe deploy image${no_color}\n"

kubectl describe deployment nginx-deployment | grep "Image"

printf "\n${yellow}>>>Rollback to tha last version${no_color}\n"

kubectl rollout undo deployment/nginx-deployment

sleep 5

printf "\n${yellow}>>>Describe deploy image after UNDO${no_color}\n"

kubectl describe deployment nginx-deployment | grep "Image"

sleep 5

printf "\n${yellow}>>>Restarting deployment${no_color}\n"

kubectl rollout restart deployment nginx-deployment

printf "\n${yellow}>>>Listing pods after restart deployment${no_color}\n"

kubectl get pods

printf "\n${yellow}>>>Getting the rollout status${no_color}\n"

kubectl rollout status deployment nginx-deployment

printf "\n${yellow}>>>Show history after the restart${no_color}\n"

kubectl rollout history deployment nginx-deployment

printf "\n${yellow}>>>Last get all\n${no_color}\n"

kubectl get all

printf "\n${yellow}>>>Delete deployment${no_color}\n"

kubectl delete deployment nginx-deployment

printf "\n${yellow}>>>Deleted!!!${no_color}\n"
