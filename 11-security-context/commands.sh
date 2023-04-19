kubectl create -f app.yml

sleep 15

clear

kubectl get pods

printf "\n\nUser running on pod:\n\n"
kubectl exec myapp -- whoami

printf "\nProcess running:\n\n"
ps

printf "\n\nDeleting\n"

kubectl delete -f app.yml
