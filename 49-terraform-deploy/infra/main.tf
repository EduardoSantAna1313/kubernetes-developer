
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

resource "kubernetes_deployment" "nginx_app" {
  metadata {
    name = "nginx-deploy"
    labels = {
      test = "nginx-deploy"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "nginx-deploy"
      }
    }

    template {
      metadata {
        labels = {
          test = "nginx-deploy"
        }
      }

      spec {
        container {
          image = "nginx"
          name  = "nginx-deploy"

          resources {
            limits = {
              cpu    = "250m"
              memory = "50Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}