while [[ $(kubectl get pod nginx -o=jsonpath='{.status.containerStatuses[*].ready}') = false ]]; do
    printf '.'
    sleep 1
done;

printf "\nThe nginx pod is ready!"