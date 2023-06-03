RED='\033[31m'
GREEN='\033[32m'
NC='\033[0m' # No Color
printf "### Criando secure-pod ###\n"

kubectl create -f secure-pod.yaml

printf "### Criando network-policy to deny requests to secure-pod ###\n"

kubectl create -f deny-netpol.yaml

printf "### Criando secure-svc ###\n"

kubectl create -f secure-svc.yaml

printf "### Criando webapp ###\n"

kubectl create -f webapp.yaml

printf "\n### Waiting for pod started ###\n"
while [[ $(kubectl get pod webapp -o=jsonpath="{.status.phase}") != "Running" ]]; do
    printf '.'
done

printf "\n### Pod started ###\n"

printf "### Test the connection between webapp e secure-service ###\n"

kubectl exec -it webapp -- sh test.sh
if [[ $? = 1 ]]; then
    printf "${RED}> Não foi possivel se conectar${NC}\n"
fi

printf "### Creating allow netpol ###\n\n"
kubectl create -f allow-netpol.yaml

kubectl get netpol

printf "\n### Waiting for the netpol ###\n"
sleep 5

printf "\n\n### Test the connection between webapp e secure-service ###\n\n"
kubectl exec -it webapp -- sh test.sh
if [[ $? = 1 ]]; then
    printf "${RED}> Não foi possivel se conectar${NC}\n"
else
    printf "${GREEN}> Successfully conected.${NC}\n"
fi

printf "\n\n### Excluindo os resources ###\n\n"
kubectl delete -f .

kubectl get pods,svc,netpol
