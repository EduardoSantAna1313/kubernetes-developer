provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}