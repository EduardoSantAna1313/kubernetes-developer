module "external_secrets" {
  source = "./modules/external-secrets"
}

module "istio" {
  source       = "./modules/istio"
  istiodvalues = file("istiod-values.yaml")
}