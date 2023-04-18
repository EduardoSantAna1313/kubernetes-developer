kubectl apply -f .

sleep 10

kubectl get pods,svc

sleep 120

kubectl delete -f .

kubectl get pods,svc
