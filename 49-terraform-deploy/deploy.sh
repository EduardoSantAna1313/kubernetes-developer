cd infra/

terraform init

terraform validate

terraform fmt -recursive

terraform apply -auto-approve

kubectl get deploy nginx-deploy

sleep 5

terraform destroy -auto-approve

kubectl delete deploy nginx-deploy
