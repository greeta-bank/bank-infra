resource "kubernetes_ingress_v1" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "simple-fanout-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
      "kubernetes.io/ingress.class" =  "nginx"
      # "nginx.ingress.kubernetes.io/proxy-set-header" = <<EOF
      #   Host $host;
      #   X-Real-IP $remote_addr;
      #   X-Forwarded-For $proxy_add_x_forwarded_for;
      #   X-Forwarded-Proto $scheme;
      # EOF      
    }  
  }

  spec {
    ingress_class_name = "nginx"

    default_backend {
     
      service {
        name = "gateway"
        port {
          number = 8080
        }
      }
    }     

    rule {
      host = "account.greeta.net"
      http {

        path {
          backend {
            service {
              name = "gateway"
              port {
                number = 8080
              }
            }
          }

          path = "/"
          path_type = "Prefix"
        }
      }
    }

    rule {
      host = "keycloak.greeta.net"
      http {

        path {
          backend {
            service {
              name = "keycloak-server"
              port {
                number = 8080
              }
            }
          }

          path = "/"
          path_type = "Prefix"
        }
      }
    }    

    rule {
      host = "kafka.greeta.net"
      http {

        path {
          backend {
            service {
              name = "kafka-ui"
              port {
                number = 8080
              }
            }
          }

          path = "/"
          path_type = "Prefix"
        }
      }
    }

    rule {
      host = "grafana.greeta.net"
      http {

        path {
          backend {
            service {
              name = "loki-stack-grafana-bridge"
              port {
                number = 80
              }
            }
          }

          path = "/"
          path_type = "Prefix"
        }
      }
    } 

    rule {
      host = "bank.greeta.net"
      http {

        path {
          backend {
            service {
              name = "bank-ui"
              port {
                number = 4200
              }
            }
          }

          path = "/"
          path_type = "Prefix"
        }
      }
    }                  
    
  }
}
