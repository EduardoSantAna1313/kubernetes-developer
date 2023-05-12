kubectl create namespace secure --dry-run=client -o yaml > namespace.yaml

kubectl create role read-only --namespace secure --verb=get,delete --resource=pods,deployments --dry-run=client -o yaml > role.yaml

kubectl create rolebinding read-only-binding --namespace secure --role=read-only --user=developer --dry-run=client -o yaml > rolebinding.yaml
