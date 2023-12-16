POD=$(kubectl get pods -l app=sample-kotlin-spring --no-headers | awk '{print $1}')
POD=sample-kotlin-spring-69fdf7684-qptx9
k get pod -o=jsonpath='{.spec.containers[0].resources.requests.cpu}' $POD

k get clusterpolicy

kubectl apply -f ../infra/policy.yaml

k get pod -o=jsonpath='{.spec.containers[0].resources.requests.cpu}' $POD