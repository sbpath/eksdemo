resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "terraform-nginx"
    labels = {
      test = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        test = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          test = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "nginx"

        }
      }
    }
  }
}


resource "kubernetes_service" "nginx" {
  metadata {
    name = "terraform-nginx"
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
