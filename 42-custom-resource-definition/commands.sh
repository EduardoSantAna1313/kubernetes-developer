
printf "\n### Creating a custom resource definition called 'Internal' ###\n"

# CRD.yml cria uma nova extensão chamada internal
kubectl create -f crd.yml


printf "\n### Creating a custom resource ###\n"

# Cria uma "Instancia" do Internal usando a notação declarada no crd.yml
kubectl create -f custom.yml

printf "\n### Listing internals ###\n"

# lista todos os "internals"
kubectl get internals

printf "\n\n### Deleting all ###\n"
kubectl delete internal my-first-crd

kubectl delete -f crd.yml