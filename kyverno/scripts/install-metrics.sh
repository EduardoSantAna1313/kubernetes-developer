git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git

kubectl create -f kubernetes-metrics-server

sleep 10

kubectl top node