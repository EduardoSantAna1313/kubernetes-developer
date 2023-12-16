## Alias para kubectl

Criar arquivo **.bash_profile** na pasta pessoal e copiar o conteúdo abaixo:

```sh
alias k="kubectl"
export do="--dry-run=client -o yaml"
export now="--force --grace-period=0"
alias kc="kubectl config set-context --current --namespace "
alias kgns="kubectl get ns"
alias kg="kubect get "
alias kgpa="kubectl get pods -A"
alias kgd="kubectl get deploy"
alias kl="kubectl logs "
alias kgs="kubectl get svc"
alias kgi="kubectl get ingress"
```

## Modo de usar 

1. Listar pods:
  ```sh
  kgp
  ```
1. Consultar logs:
  ```sh
  kl <pod>
  ```
1. Excluir pod imediatamente:
  ```sh
  k delete pod <pod> $now
  ```