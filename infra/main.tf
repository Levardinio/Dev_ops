resource "azurerm_resource_group" "rg" {
  name     = "${var.name_prefix}-rg"
  location = var.location
}

# Container Instance to run the Flask app
resource "azurerm_container_group" "flask_app" {
  name                = "${var.name_prefix}-flask-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Public"
  dns_name_label      = "${var.name_prefix}-flask-app"
  os_type             = "Linux"

  container {
    name   = "flask-app"
    image  = var.docker_image
    cpu    = "0.5"
    memory = "1.0"

    ports {
      port     = var.container_port
      protocol = "TCP"
    }

    environment_variables = {
      FLASK_ENV = "production"
    }

    liveness_probe {
      http_get {
        path   = "/health"
        port   = var.container_port
        scheme = "http"
      }
      initial_delay_seconds = 30
      period_seconds        = 30
      timeout_seconds       = 5
      failure_threshold     = 3
    }

    readiness_probe {
      http_get {
        path   = "/health"
        port   = var.container_port
        scheme = "http"
      }
      initial_delay_seconds = 10
      period_seconds        = 10
      timeout_seconds       = 5
      failure_threshold     = 3
    }
  }

  tags = {
    Environment = "demo"
    Application = "flask-webapp"
  }
}

