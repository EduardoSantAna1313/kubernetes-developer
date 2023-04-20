# Create pod definition
kubectl run nginx-pod --image=nginx --labels="name=pod-nginx,tier=frontend" --dry-run=client -o yaml >> app.yml

# Create pod
kubectl apply -f app.yml

# Get pod
kubectl get pods -A
