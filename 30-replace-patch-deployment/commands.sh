kubectl create -f app-deployment.yml

sleep 5

printf "\n**********************************\n"
printf "\n*               GET              *\n"
printf "\n**********************************\n"
kubectl get pods

kubectl replace -f app-replacement.yml

sleep 5

printf "\n**********************************\n"
printf "\n*               GET              *\n"
printf "\n**********************************\n"
kubectl get pods

kubectl patch deployment myapp-alpine-deploy --patch-file app-deployment.yml

sleep 5

printf "\n**********************************\n"
printf "\n*               GET              *\n"
printf "\n**********************************\n"
kubectl get pods

printf "\n**********************************\n"
printf "\n*             HISTORY            *\n"
printf "\n**********************************\n"
kubectl rollout history deploy myapp-alpine-deploy


printf "\n**********************************\n"
printf "\n*             DESCRIBE           *\n"
printf "\n**********************************\n"
kubectl describe deploy myapp-alpine-deploy

printf "\n**********************************\n"
printf "\n*              DELETE            *\n"
printf "\n**********************************\n"
kubectl delete deploy myapp-alpine-deploy

