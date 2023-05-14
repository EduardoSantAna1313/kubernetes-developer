printf "### Deleting the resources ###\n"

kubectl delete svc nginx-svc

kubectl delete pod nginx

kubectl get pods,svc