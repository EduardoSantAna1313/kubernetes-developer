cd terraform/

terraform init

if [[ $(terraform validate) == 1 ]]; then
    exit 1;
else
    printf ("Arquivo validado com sucesso")
fi

terraform fmt -recursive

terraform apply -auto-approve