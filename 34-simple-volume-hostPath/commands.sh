printf ">>> Building the image:\n"

bash build.sh

printf "\n\n>>> Criando o pod:\n"

kubectl apply -f pod.yml

sleep 5

printf "\n\n>>> Running pods:\n"

kubectl get pods

printf ">>> Logs do pod:\n\n"

kubectl exec -it go-logger-pod -- bash

printf "\n\n>>> Excluindo o pod...\n"

kubectl delete -f pod.yml
