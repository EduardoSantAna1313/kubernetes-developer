kubectl create -f .

kubectl rollout status deploy/nginx-deploy

kubectl set image deploy/nginx-deploy nginx-container=nginx:1.24 --record

kubectl get pods,rs

kubectl rollout status deploy/nginx-deploy

kubectl get pods,rs

kubectl rollout history deploy/nginx-deploy

kubectl delete -f .