Exemplo com role e rolebind para realizar gerenciamento de permissões.

1. criado um namespace `secure`.
1. Criada role `read-only` que dá permissão get e delete para `pods` e `deployments` no namespace=secure.
1. Criado rolebinding para atrelar o usuário `developer` à role `read-only` no namespace=secure.
1. Realizado teste para validar as permissões usando os comandos:
    - `kubectl create deployment redis --image redis --namespace secure --as developer`
        Este comando deve retornar 0 (zero) pois não é permitido a criação de deployment pelo user `developer`
    - `kubectl delete deployment first-deploy --namespace secure --as developer`
        Este comando é executado com sucesso, porém msg de erro é lançada no console, pois poderia ser erro de configuração da role que deveria ser `read-only`.
