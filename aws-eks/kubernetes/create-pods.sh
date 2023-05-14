printf "Configuring the kubectl...\n"
aws eks update-kubeconfig --region sa-east-1 --name my-eks-cluster

printf "\n\n### Starting the nginx pod ###\n"
kubectl run nginx --image=nginx --port=80

bash wait-pod.sh

printf "\n\n### Creating the LoadBalancer ###\n"
kubectl expose pod nginx --name=nginx-svc --target-port=80 --port=80 --type=LoadBalancer

printf "\n\n ### Change the home page ###\n"
kubectl exec -it nginx -- bash -c "echo '<h1>First aws eks</h1>' > /usr/share/nginx/html/index.html"

printf "\n\n### List the resources ###\n"
kubectl get pods,svc

bash test-connect.sh
