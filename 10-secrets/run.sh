kubectl create -f app-secret.yml

kubectl create -f app-deployment.yml

kubectl create -f app-svc.yml

kubectl rollout status deployment app-secrets-deploy

kubectl get deploy,svc,secrets

curl localhost:30001

kubectl delete -f .
