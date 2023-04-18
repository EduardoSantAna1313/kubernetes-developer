printf "\n\nCreating the pod and the service\n"

kubectl apply -f .

sleep 15

printf "\n\nPod status\n\n"

kubectl get pod,svc

printf "\n\ncurl...........................\n\n"

curl localhost:30000

printf "\n\ncurl^^^^^^^^^^^^^^^^^^^^^^^^^^^\n\n"

printf "\n\nDeleting\n"

kubectl delete -f .

