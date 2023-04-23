# label node
kubectl label node docker-desktop color=blue

kubectl create -f blue-deployment.yml

sleep 5

kubectl get pods -o wide

kubectl delete deploy blue-deploy

# unlabel node
kubectl label node docker-desktop color-
