kubectl apply -f .

kubectl sleep 10

kubectl get pods

kubectl describe pod multicontainer

# Acessar o container "kibana-logs" dentro do pod multicontainer e executar o ls 
kubectl exec -it multicontainer -c kibana-logs -- ls bin/

kubectl delete -f .
