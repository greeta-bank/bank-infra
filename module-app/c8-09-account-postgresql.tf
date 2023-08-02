resource "kubernetes_deployment_v1" "account_postgres" {
  metadata {
    name = "account-postgres"

    labels = {
      db = "account-postgres"
    }
  }

  spec {
    selector {
      match_labels = {
        db = "account-postgres"
      }
    }

    template {
      metadata {
        labels = {
          db = "account-postgres"
        }
      }

      spec {
        container {
          name  = "account-postgres"
          image = "postgres:14.4"

          env {
            name  = "POSTGRES_PASSWORD"
            value = "techbankRootPsw"
          }

        }
      }
    }
  }
}

resource "kubernetes_service" "account_postgres" {
  metadata {
    name = "account-postgres"

    labels = {
      db = "account-postgres"
    }
  }

  spec {
    type = "ClusterIP"

    selector = {
      db = "account-postgres"
    }

    port {
      protocol    = "TCP"
      port        = 5432
      target_port = 5432
    }
  }
}

resource "kubernetes_horizontal_pod_autoscaler_v1" "account_postgres_hpa" {
  metadata {
    name = "account-postgres-hpa"
  }
  spec {
    max_replicas = 2
    min_replicas = 1
    scale_target_ref {
      api_version = "apps/v1"
      kind = "Deployment"
      name = kubernetes_deployment_v1.account_postgres.metadata[0].name 
    }
    target_cpu_utilization_percentage = 80
  }
}