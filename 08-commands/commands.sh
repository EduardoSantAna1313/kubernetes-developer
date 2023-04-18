docker build -f Dockerfile -t alpine-sleep:v1 .

kubectl create -f app.yml

printf "\n\nDescribing the pod with args\n\n"

kubectl get pods -o yaml

sleep 25

kubectl delete -f app.yml

kubectl rollout status deployment myapp-sleep

docker rmi alpine-sleep:v1 