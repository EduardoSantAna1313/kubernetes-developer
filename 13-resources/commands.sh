docker rmi resources:v1

printf "\n\nBuilding the image...\n"
docker build -t resources:v1 app/

printf "\n\nCreating the pod...\n\n"
kubectl create -f app-definition.yml

sleep 3

printf "\n\nGetting the pod...\n"
kubectl get pods 

printf "\n\nDeleting the pod...\n"
kubectl delete pod myapp-limited
