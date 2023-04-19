# Create the definitions yaml files for each resource
kubectl create secret generic app-secrets --from-literal="APP_COLOR=burlywood" --from-literal="APP_CONTENT=MYSECRETCONTENT" --dry-run=client -o yaml > app-secret.yml

kubectl create deploy app-secrets-deploy --port=80 --image=appflask:v1 --replicas=1 --dry-run=client -o yaml > app-deployment.yml

kubectl create svc nodeport app-service --tcp=80:80 --node-port=30001 --dry-run=client -o yaml > app-svc.yml
