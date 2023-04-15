printf ">>>Creating deployment"

kubectl create deployment nginx-deployment \
    --image=nginx \
    --replicas=3

printf ">>>List deployments\n"

kubectl get deploy 

printf "\n>>>Get pods\n"

kubectl get pods

printf "\n>>>Status rollout deployment\n"

kubectl rollout status deployment nginx-deployment

printf "\n>>>Pods\n"

kubectl get pods

printf "\n>>>Show history\n"

kubectl rollout history deployment nginx-deployment

printf "\n>>>Restarting deployment\n"

kubectl rollout restart deployment nginx-deployment

printf "\n>>>Getting the rollout status\n"

kubectl rollout status deployment nginx-deployment

printf "\nListing pods after restart deployment\n"

kubectl get pods

printf "\n>>>Show history after the restart\n"

kubectl rollout history deployment nginx-deployment

printf "\n>>>Delete deployment\n"

kubectl delete deployment nginx-deployment
