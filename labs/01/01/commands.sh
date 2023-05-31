kubectl explain pv.spec

kubectl explain pvc.spec

kubectl create -f pv.yaml

kubectl create -f pvc.yaml

kubectl create -f pod.yaml

kubectl exec -it logger -- touch /var/www/nginx/index.html

kubectl delete -f .