kubectl get nodes

kubectl describe node docker-desktop

# label node
kubectl label node docker-desktop color=blue

kubectl create -f red-deploymeny.yml

kubectl get pods -o wide

kubectl delete deploy red-deploy

# unlabel node
kubectl label node docker-desktop color-
