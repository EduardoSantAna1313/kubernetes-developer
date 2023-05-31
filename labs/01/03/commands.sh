# create namespace definition
#kubectl create ns dvl1987 -o yaml --dry-run=client > ns.yaml

# create configmap definition
#kubectl create cm time-config --from-literal="TIME_FREQ=10"  --namespace dvl1987 -o yaml --dry-run=client > configmap.yaml

# create pod definition
#kubectl run time-check --image=busybox --namespace dvl1987 -o yaml --dry-run="client" -- "sh -c while true; do date; sleep $TIME_FREQ;done > opt/time/time-check.log"  > pod.yaml

# create the resources
kubectl create -f ns.yaml

kubectl create -f configmap.yaml

kubectl create -f pod.yaml

sleep 15

printf "\n\n### Show the logs ###\n\n"
kubectl exec -it time-check -n dvl1987 -- cat /opt/time/time-check.log

printf "\n\n### Deleting the resources ###\n\n"
kubectl delete -f .