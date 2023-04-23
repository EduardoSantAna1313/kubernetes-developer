kubectl run my-pod --image=nginx 

# Add the label "app=test" to my-pod
kubectl label pod my-pod app=test

kubectl describe pod my-pod | grep Labels

# remove the label app
kubectl label pod my-pod app-

kubectl describe pod my-pod | grep Labels

kubectl delete pod my-pod
