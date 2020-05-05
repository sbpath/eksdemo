resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
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
          image = "nginx"
          name  = "nginx"
          port {
            container_port = "80"
	  }
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
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
