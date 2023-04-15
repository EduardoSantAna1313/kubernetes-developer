printf ">>>Creating deployment"

kubectl create deployment nginx-deployment \
    --image=nginx \
    --replicas=3

printf ">>>List deployments\n"

kubectl get deploy 

printf "\n>>>Sleeping for 10s<<<\n"
sleep 10

printf "\n>>>Get pods\n"

kubectl get pods

printf "\n>>>Status rollout deployment\n"

kubectl rollout status deployment nginx-deployment

printf "\n>>>Pods\n"

kubectl get pods

printf "\n>>>Show history\n"

kubectl rollout history deployment nginx-deployment

printf "\n>>>Change the replicas\n"

kubectl scale deployment nginx-deployment --replicas=1 --record

printf "\n>>>Sleeping for 5s<<<"

sleep 5

printf "\n>>>Get pods after scale\n"

kubectl get pods

printf "\n>>>Set the image\n"

kubectl set image deployment nginx-deployment nginx=nginx:1.18 --record

printf "\n>>>Describe deploy image\n"

kubectl describe deployment nginx-deployment | grep "Image"

printf "\n>>>Restarting deployment\n"

kubectl rollout restart deployment nginx-deployment

printf "\n>>>Listing pods after restart deployment\n"

kubectl get pods

printf "\n>>>Getting the rollout status\n"

kubectl rollout status deployment nginx-deployment

printf "\n>>>Show history after the restart\n"

kubectl rollout history deployment nginx-deployment

printf "\n>>>Last get all\n\n"

kubectl get all

printf "\n>>>Delete deployment\n"

kubectl delete deployment nginx-deployment
