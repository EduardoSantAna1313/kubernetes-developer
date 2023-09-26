if [[ $(kubectl get deploy terraform-example --no-headers | wc -l) == 1 ]]; then
    printf "### Deleting deploy terraform-example ###\n"
    kubectl delete deploy terraform-example
fi

if [[ $(kubectl get ns external-secrets --no-headers | wc -l) == 1 ]]; then
    printf "### Deleting namespace external-secrets ###\n"
    kubectl delete ns istio-system --force --grace-period=0
fi

if [[ $(kubectl get ns istio-system --no-headers | wc -l) == 1 ]]; then
    printf "### Deleting namespace istio-system ###\n"
    kubectl delete ns istio-system --force --grace-period=0
fi

terraform destroy -auto-approve
