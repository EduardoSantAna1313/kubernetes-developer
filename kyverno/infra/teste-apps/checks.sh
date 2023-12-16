POD1=$(kubectl get pods -l app=app1 --no-headers | awk '{print $1}')
POD2=$(kubectl get pods -l app=app2 --no-headers | awk '{print $1}')
POD3=$(kubectl get pods -l app=app3 -n default --no-headers | awk '{print $1}')
k get pod -o=jsonpath='{.spec.containers[0].resources.requests.cpu}' $POD1
k get pod -o=jsonpath='{.spec.containers[0].resources.requests.cpu}' $POD2
k get pod -o=jsonpath='{.spec.containers[0].resources.requests.cpu}' -n default $POD3

k get clusterpolicy

kubectl apply -f ../infra/policy.yaml

k get pod -o=jsonpath='{.spec.containers[0].resources.requests.cpu}' $POD