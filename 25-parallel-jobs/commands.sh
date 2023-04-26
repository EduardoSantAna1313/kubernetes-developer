# docker build -t randomerror:v1 app

kubectl create -f job.yml

kubectl get jobs

sleep 10

# Some of the pods will be having some issues, so other pods will be started.
# In the end, must have three pods completed because the conf "completions: 3" 
kubectl get pods

printf "\n\n\nShowing the logs\n\n"

kubectl logs -l app=java --prefix=true

printf "\n\nList the pods\n\n"
kubectl get pods

kubectl get jobs

kubectl delete -f .
