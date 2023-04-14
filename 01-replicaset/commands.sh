kubectl get pods -A

printf "\n>>> Apply\n"

kubectl apply -f replica-definition.yml

printf "\n>>> List pods\n"

kubectl get pods -A

printf "\n>>> List replicas\n"

kubectl get rs

printf "\n>>>Change the replicas\n"

kubectl scale --replicas=5 rs/replica-myapps

printf "\n>>>New value for replicas:"

kubectl get rs

printf "\n>>> Delete replica\n"

kubectl delete rs replica-myapps

printf "\n>>> List replicas\n"

kubectl get rs

