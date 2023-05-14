RED='\033[31m'
GREEN='\033[32m'
NC='\033[0m' # No Color

printf "\n\nCreating the resources...\n"
kubectl create -f namespace.yaml

kubectl create -f role.yaml

kubectl create -f rolebinding.yaml

clear

printf "\n\nCriando deploy NGINX with default user:\n\n"
kubectl create deploy first-deploy --image=nginx --namespace secure

printf "\n\nListing the deploys as developer USER:\n\n"
kubectl get deploys --namespace secure --as developer
if [[ $? == 0 ]]; then
    printf "\n=> ${GREEN}OK${NC}. The role configuration is right!!!\n"
else 
    printf "\n\n=> ${RED}ERROR! The role must ALLOW list the deployments!${NC}\n"
fi

printf "\n\nGetting the deploy as developer USER:\n"
kubectl get deploy first-deploy --namespace secure --as developer
if [[ $? == 0 ]]; then
    printf "\n=> ${GREEN}OK${NC}. The role configuration is right!!!\n"
else 
    printf "\n\n=> ${RED}ERROR! The role must ALLOW getting the deployment!${NC}\n"
fi

printf "\n\nTrying to create a deployment as developer USER:\n"

kubectl create deployment redis --image redis --namespace secure --as developer
if [[ $? == 1 ]]; then
    printf "\n=> ${GREEN}OK${NC}. The role configuration is right!!!\n"
else 
    printf "\n\n=> ${RED}ERROR! The role read-only must NOT ALLOW creating the deployment!${NC}\n"
fi

printf "\n\nTrying to delete deployment nginx as developer USER:\n"

kubectl delete deployment first-deploy --namespace secure --as developer
if [[ $? == 1 ]]; then
    printf "\n=> ${GREEN}OK${NC}. The role configuration is right!!!\n"
else 
    printf "\n\n=> ${RED}ERROR! The role read-only must NOT ALLOW deleting the deployment!${NC}\n"
fi

printf "\n\nGet the deploys:\n"
kubectl get deploy --namespace secure

printf "\n\nDeleting the resouces...\n"
kubectl delete -f rolebinding.yaml
kubectl delete -f role.yaml
kubectl delete -f namespace.yaml
