# kubectl create deploy redis --image="redis:alpine" --replicas="1" -o="yaml" --dry-run="client" > redis.yaml


kubectl explain deploy.spec.template.spec.volumes

kubectl create cm redis-config --from-literal="NAME=NAMENAMENAMENAME"

kubectl create -f redis.yaml

POD_NAME=$(kubectl get pods --no-headers -o="custom-columns=Name:.metadata.name")
kubectl exec -it $POD_NAME -- sh -c cat /redis-master/NAME

kubectl delete cm redis-config

kubectl delete -f  redis.yaml
