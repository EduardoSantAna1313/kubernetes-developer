## Redimencionamento de Request/Limit de CPU com Kyverno

Baseado no artigo [Resize CPU Limit To Speed Up Java Startup on Kubernetes](https://piotrminkowski.com/2023/08/22/resize-cpu-limit-to-speed-up-java-startup-on-kubernetes/).

Documentação oficial kyverno sobre [Mutate Rules](https://kyverno.io/docs/writing-policies/mutate/).

## Instalar kyverno no cluster

- Add o repo do kyverno ao helm
  ```
  helm repo add kyverno https://kyverno.github.io/kyverno/
  ```

- Instalar chart
  
  ```bash
  helm install kyverno kyverno/kyverno -n kyverno \
    --create-namespace -f values.yaml
  ```

## Criar deployment

  O Pod deverá ser da classe [**Burstable**](https://kubernetes.io/pt-br/docs/tasks/configure-pod-container/quality-service-pod/), caso o Pod seja **Guaranteed** a policy não poderá ser aplicada, pois o Pod será imutável.

## Criar role

  Crie uma ClusterRole para dar permissão para o kyverno fazer operações de patch:

  ```yaml
  apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kyverno:update-pods
  labels:
    app.kubernetes.io/component: background-controller
    app.kubernetes.io/instance: kyverno
    app.kubernetes.io/part-of: kyverno
rules:
  - verbs:
      - patch
      - update
    apiGroups:
      - ''
    resources:
      - pods
  ```

## Crie a policy para alterar os recursos

A policy abaixo irá alterar o **resources.requests.cpu** para 50m dos containers com nome **sample-kotlin-spring** após o **status.containerStatuses[0].ready** for **true**.

```yaml
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: resize-pod-policy
  namespace: demo
spec:
  mutateExistingOnPolicyUpdate: true
  rules:
    - name: resize-pod-policy
      match:
        any:
          - resources:
              kinds:
                - Pod/status
                - Pod
      preconditions: 
        all:
          - key: "{{request.object.status.containerStatuses[0].ready}}"
            operator: Equals
            value: true
      mutate:
        targets:
          - apiVersion: v1
            kind: Pod
            name: "{{request.object.metadata.name}}"
        patchStrategicMerge:
          spec:
            containers:
              - (name): sample-kotlin-spring
                resources:
                  requests:
                    cpu: 50m
```

Caso realize o scale do deploy, a policy irá detectar automaticamente os novos containers e aplicar a policy quanto eles estiverem **ready=true**.

```sh
kubectl scale deploy sample-kotlin-spring --replicas 3
```

## Inicializar cluster com minikube

Caso seja necessário subir um cluster local com **minikube**:

```bash
minikube start --memory='2g' --feature-gates=InPlacePodVerticalScaling=true

# instalar metrics-server
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git

kubectl create -f kubernetes-metrics-server/

```