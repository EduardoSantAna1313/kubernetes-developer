NAMESPACE=helm-test

printf "### Searching for mysql repos: ###\n\n"

helm search repo mysql

printf "\n### Installing mysql with values: ###\n\n"

helm install mysql bitnami/mysql --values=values.yaml -n $NAMESPACE

printf "\n\n### Showing the password: ###\n\n"
kubectl get secret --namespace $NAMESPACE mysql -o jsonpath="{.data.mysql-root-password}" | base64 -d

printf "\n\n### List all of the resources: ###\n\n"
kubectl get all -n $NAMESPACE

printf "\n\n### Deleting all of the resources: ###\n\n"
helm uninstall mysql -n $NAMESPACE
