printf "\n\n### Installing mysql ###\n\n"
helm install mydb bitnami/mysql --set auth.rootPassword=Test1234

printf "\n\n### Getting the values from mydb release ###\n\n"

helm get values mydb

printf "\n\n### Upgrading the release mydb ###\n\n"

helm upgrade mydb bitnami/mysql --set auth.rootPassword=Bla1234

printf "\n\n### Showing the new values ###\n\n"

helm get values mydb

pritnf "\n\n### Listing the installed releases ###"

helm list

printf "\n\n### Showing the secrets ###\n\n"

kubectl get secrets

printf "\n\n### Uninstalling the release and keeping the history ###\n\n"

helm uninstall mydb --keep-history

printf "\n\n### Showing the secrets ###\n\n"

kubectl get secrets

printf "\n\n### Deleting the secrets ###\n\n"
kubectl delete secret sh.helm.release.v1.mydb.v2
kubectl delete secret sh.helm.release.v1.mydb.v1


printf "\n\n### listing all resources ###\n\n"
kubectl get all
