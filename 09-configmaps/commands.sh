kubectl create -f .

kubectl rollout status deploy colorapp-deploy

curl localhost:30001

kubectl get deploy,cm,svc

kubectl describe cm my-config-map

sleep 10

kubectl delete -f .

