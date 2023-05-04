printf "\n\n### Creating the POD, the Service and the ingress ###\n\n"

kubectl run goapp-pod --image=goapp:v1 --labels="app=golang" --port=8080

# Using the command EXPOSE instead of direct creating a Service of type NodePort
# The node-port will be random between the available ports for the cluster and Node
kubectl expose pod goapp-pod \
    --name=goapp-svc \
    --port=8080 \
    --target-port=8080 \
    --type=NodePort

# Creating a Nginx ingress to access the previous created Service
kubectl create ingress goapp-ingress \
    --rule="kubernetes.docker.internal/*=goapp-svc:8080" \
    --class="nginx" \
    --annotation nginx.ingress.kubernetes.io/ssl-redirect="false" \
    --annotation nginx.ingress.kubernetes.io/ingress-nginx-controller-host="kubernetes.docker.internal"

sleep 10

kubectl get pod,svc,ingress

# Call the api via curl and showing the received message
printf "\n\n### Call the API ###\n\n"
curl kubernetes.docker.internal

printf "\n\n### Deleting the resources ###\n\n"

kubectl delete ingress goapp-ingress

kubectl delete svc goapp-svc

kubectl delete pod goapp-pod

printf "\n\n### checking the resources ###\n\n"

kubectl get pod,svc,ingress
