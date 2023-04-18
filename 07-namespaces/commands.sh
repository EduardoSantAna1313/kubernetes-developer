#kubectl create namespace app-namespace --dry-run=client -o yaml > app-ns.yml

#kubectl create deploy myapp --image=nginx --port=80 --replicas=1 --namespace=app-namespace --dry-run=client -o yaml > app-deployment.yml

#kubectl create service nodeport myapp-svc --tcp=80:80 --node-port=30001 --dry-run=client --namespace=app-namespace -o yaml > app-svc.yml

kubectl get namespaces

kubectl create -f .

kubectl rollout status deployment myapp -n app-namespace

kubectl get deploy,svc -n app-namespace

curl localhost:30000

kubectl delete -f .

kubectl get deploy,svc -n app-namespace
