kubectl get nodes

# Add taint "app" do the node "docker-desktop"
kubectl taint node docker-desktop app=MyTaint:NoSchedule

# Show the added taint to the node
kubectl describe node docker-desktop | grep Taint

# First pod will be on pendng status
kubectl apply -f app-pending.yml

# Second pod can be schedule because it has the toleration
kubectl apply -f app-running.yml

# The pod mypod-pending cannot be ready because the Node Taint
kubectl get pods -o wide

# Remove the taint from the node
kubectl taint node docker-desktop app=MyTaint:NoSchedule-

kubectl describe node docker-desktop | grep Taint

# All the pods are running now
kubectl get pods -o wide

printf "\n\nDeleting...\n\n"

kubectl delete -f app-pending.yml

kubectl delete -f app-running.yml

