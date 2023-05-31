# kubectl create deploy nginx-deploy --replicas=4 --image="nginx:1.16" -o="yaml" --dry-run="client" > nginx-deploy.yaml

kubectl create -f nginx-deploy.yaml

printf "\n\n### Deploy current image: "
kubectl get deploy nginx-deploy -o=jsonpath="{.spec.template.spec.containers[*].image}"

printf "\n\n### Deploy change image ###\n\n"
kubectl set image deploy nginx-deploy nginx=nginx:1.17

printf "\n\n### Deploy current image: "
kubectl get deploy nginx-deploy -o=jsonpath="{.spec.template.spec.containers[*].image}"

# rollback the last version

printf "\n\n### Rollout UNDO ###\n\n"
kubectl rollout undo deploy nginx-deploy

printf "\n\n### Deploy current image: "
kubectl get deploy nginx-deploy -o=jsonpath="{.spec.template.spec.containers[*].image}"

printf "\n\n### Rollout history ###\n\n"
kubectl rollout history deploy nginx-deploy

printf "\n\n### Deleting deploy ###\n\n"
kubectl delete -f nginx-deploy.yaml