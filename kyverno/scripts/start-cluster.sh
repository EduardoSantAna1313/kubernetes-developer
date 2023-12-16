minikube start \
  --memory='2g' \
  --feature-gates=InPlacePodVerticalScaling=true

#minikube start \
#  --memory='8g' \
#  --kubernetes-version=1.27.0 \
#  --feature-gates=InPlacePodVerticalScaling=true \
#  --no-vtx-check -p minikube

minikube -p minikube docker-env

eval $(minikube -p minikube docker-env)

helm repo add kyverno https://kyverno.github.io/kyverno/


helm install kyverno kyverno/kyverno -n kyverno \
  --create-namespace -f values.yaml

