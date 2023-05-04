printf "\n\n### building the image ###\n\n"
bash build.sh

printf "\n\n### Creating the Pods ###\n\n"
kubectl create -f first-pod.yml
kubectl create -f second-pod.yml

printf "\n\n### Creating the Service ###\n\n"
kubectl create -f first-svc.yml
kubectl create -f second-svc.yml

printf "\n\n### Creating the Ingress ###\n\n"
kubectl create -f ingress.yml

printf "\nWaiting for the ingress start\n"
sleep 10

kubectl get ingress

sleep 5

printf "\n\n*** Accessing the FIRST pod through the ingress ***\n"
curl http://kubernetes.docker.internal/first

printf "\n\n*** Accessing the SECOND pod through the ingress ***\n"
curl http://kubernetes.docker.internal/second


printf "\n\n###Deleting the resources ###\n\n"
kubectl delete -f .

printf "\n\n### Checking the resources ###\n\n"
kubectl get pods,svc,ingress
