printf "\n>>>Gerando deployment-definition.yml apartir de kubectl create"

kubectl create deployment nginx-deployment \
    --image=nginx \
    --replicas=3 \
    --dry-run=client \
    -o yaml \
    > deployment-definition.yml

printf "\n>>>Arquivo gerado!"
