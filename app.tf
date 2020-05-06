resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "my-nginx"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        run = "my-nginx"
      }
    }

    template {
      metadata {
        labels = {
          run = "my-nginx"
        }
      }

      spec {
        container {
          image = "nginx"
          name  = "my-nginx"
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
    name = "my-nginx"
  }
  spec {
    selector = {
      run = "my-nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
