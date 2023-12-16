cd ../app

docker context use default

eval $(minikube docker-env)

docker build -t kyverno-java:v2 .

minikube image load kyverno-java:v2

kyverno-java:latest