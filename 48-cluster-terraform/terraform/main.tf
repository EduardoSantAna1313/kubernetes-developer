module "app" {
  source = "./modules/nginx-deploy"
}

module "external_secrets" {
  source = "./modules/external-secrets"
}

module "istio" {
  source       = "./modules/istio"
  istiodvalues = file("istiod-values.yaml")
}

