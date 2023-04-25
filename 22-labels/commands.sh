kubectl run first-pod --image=busybox --labels="app=first,color=red,tier=back"

kubectl run second-pod --image=busybox --labels="app=second,color=red,tier=front"

kubectl run third-pod --image=busybox --labels="app=third,color=red,tier=front"

printf "\n\nList all pods\n\n"
kubectl get pods

printf "\n\nselecting pods with color=red\n\n"
kubectl get pods --selector="color=red"

printf "\n\nselecting pods with color=red and tier=front\n\n"
kubectl get pods --selector color=red,tier=front

printf "\n\nselecting pods with color=red and tier=front and app=thrid\n\n"
kubectl get pods --selector color=red,tier=front,app=third

printf "\n\nDeleting all\n\n"
kubectl delete pod --selector color=red


kubectl get pods