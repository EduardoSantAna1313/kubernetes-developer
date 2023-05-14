RED='\033[31m'
GREEN='\033[32m'
NC='\033[0m' # No Color

cd infra/

printf "\n\nFormatando...\n"
terraform fmt -recursive

printf "\n\nInicializando os modulos...\n"
terraform init

printf "\n\nValidando...\n"

terraform validate
if [[ $? == 1 ]]; then
    printf "\n${RED}Falha na validação!${NC}\n"
    exit 1
fi

printf "\n\nCriando plan...\n"
terraform plan -out eks-plan


printf "\n\nApply...\n"
terraform apply "eks-plan"