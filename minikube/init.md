# Instalação

[Get Started](https://minikube.sigs.k8s.io/docs/start/)

1. PowerShell:
    ```bash
    New-Item -Path 'c:\' -Name 'minikube' -ItemType Directory -Force
    Invoke-WebRequest -OutFile 'c:\minikube\minikube.exe' -Uri 'https://github.com/kubernetes/minikube/releases/latest/download/minikube-windows-amd64.exe' -UseBasicParsing
    ```
1. Add o .exe ao PATH
    ```bash
    $oldPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine)
    if ($oldPath.Split(';') -inotcontains 'C:\minikube'){ `
        [Environment]::SetEnvironmentVariable('Path', $('{0};C:\minikube' -f $oldPath), [EnvironmentVariableTarget]::Machine) `
    }
    ```

# Criação do cluster

1. Start do cluster com multiplos Nodes:
    ```bash
    minikube start --driver=virtualbox --no-vtx-check --nodes 2  -p minikube
    ```
    - `-p` seta o nome do profile. Usado o profile default `minikube`.
1. Verificar os nodes:
    ```
    kubectl get nodes
    ```
1. Caso ocorra erro de TLS:
    - Listar os profiles:
        ```
        minikube profile list
        ```
    -  Recuperar o IP do Cluster (profile default, nao é necessário usar a flag `-p minikube`):
        ```bash
        minikube status
        ```
    - Setar o IP na variavel de ambiente `NO_PROXY`:
        ```bash
        set NO_PROXY=192.168.59.107
        ```
# Criando primeiro Deploy

1. Criar deploy nginx:
    ```bash
    kubectl create deploy nginx --image=nginx:latest --replicas=2
    ```
1. Criar service para expor o deploy:
    ```bash
    kubectl expose deploy nginx --type=NodePort --port=80
    ```
1. Verificar URL do service:
    ```bash
    minikube service list
    ```
1. Curl
    ```js
    curl http://192.168.59.102:31029
    ```


# Excluindo o cluster
1. Stop cluster:
    ```
    minikube stop
    ```
1. Excluindo:
    ```
    minikube delete
    ```
