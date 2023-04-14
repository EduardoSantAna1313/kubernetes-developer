printf "\n>>>Creating deployment"

kubectl create -f deployment-definition.yml

printf "\n>>>List deployments"

kubectl get deploy

printf "\n>>>Delete the deployment"

kubectl delete deployment nginx-deployment
