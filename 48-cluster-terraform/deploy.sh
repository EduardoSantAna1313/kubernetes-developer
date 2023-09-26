cd terraform/

printf "### Inicializando terraform ###\n"
if [[ $(terraform init) == 1 ]]; then
    printf "\nERRO! Execute o comando 'terraform init' para mais detalhes.\n"
    exit 1;
fi

DESTROY=$(cat destroy)
if [[ "$DESTROY" = "destroy=true" ]]; then
    printf "\n### REALIZANDO DESTROY ###\n\n"
    terraform destroy -auto-approve
fi

if [[ $(terraform fmt -check) == 1 ]]; then
    printf "### Formatando o código... ###\n"
    terraform fmt -recursive
else
    printf "### Código formatado! ###\n"
fi

printf "### Validando terraform ###\n"
if [[ $(terraform validate) == 1 ]]; then
    exit 1;
else
    printf "Arquivo validado com sucesso!\n\n";
fi

printf "### Terraform apply ###\n"
terraform apply -auto-approve
