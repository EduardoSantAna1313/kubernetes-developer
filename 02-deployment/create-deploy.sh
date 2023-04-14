printf "\n>>>Criando deployment"
kubectl create deployment nginx-deploy --image=nginx --replicas=3

printf "\n>>>Listando os deployments"

kubectl get deploy

printf "\n>>>Excluindo o deployment"

kubectl delete deployment nginx-deploy

