printf ">>> Building the image:\n"

bash build.sh

printf "\n\n>>> Criando o PersistentVolume:\n"

kubectl create -f pv.yml

printf "\n\n>>> Criando o PersistentVolumeClaim\n"

kubectl create -f pvc.yml

printf "\n\n>>> Criando o pod:\n"

kubectl create -f pod.yml

sleep 25

printf "\n\n>>> Showing the resources:\n"

kubectl get pod,pv,pvc


printf ">>> Logs do pod:\n\n"

# windows... :(
cat C:\\pv\\logs\\app.log

rm C:\\pv\\logs\\app.log

printf "\n\n>>> Excluindo os resources...\n"

kubectl delete -f pod.yml

kubectl delete -f pvc.yml

kubectl delete -f pv.yml

printf "\n\n>>> List the resources...\n"

kubectl get pod,pv,pvc
