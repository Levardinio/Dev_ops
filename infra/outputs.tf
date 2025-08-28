output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "flask_app_url" {
  description = "Public URL of the Flask application"
  value       = "http://${azurerm_container_group.flask_app.fqdn}:${var.container_port}"
}

output "flask_app_fqdn" {
  description = "Fully qualified domain name of the Flask application"
  value       = azurerm_container_group.flask_app.fqdn
}

output "flask_app_ip" {
  description = "Public IP address of the Flask application"
  value       = azurerm_container_group.flask_app.ip_address
}