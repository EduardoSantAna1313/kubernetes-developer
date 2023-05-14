# kubernetes-developer
Repositório para Certificação CKAD - Kubernetes Developer

Cursos de referência:
- [Kubernetes for the Absolute Beginners](https://www.udemy.com/course/learn-kubernetes/)
- [Kubernetes Certified Application Developer (CKAD)](https://www.udemy.com/course/certified-kubernetes-application-developer/)

## Commands

1. kubectl `api-resources`
    Lista as apis e os comandos
1. kubectl `explain`
    Exibe detalhe sobre algum parametro de configuração. Ex.: `kubectl explain pod.spec.containers.image`
1. kubectl `auth -can-i`
    Verifica se é possivel executar um comando. Ex.: `kubectl auth can-i get pods` irá verificar se o usuário atual pode listar os pods. Este comando pode ser utilizado com a flag `--as`: `kubectl auth can-i delete deploy --as dev-user` 
