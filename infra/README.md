# Flask App Infrastructure

This Terraform configuration creates minimal Azure infrastructure to run a Flask web application from a Docker image hosted on GitHub Container Registry (GHCR.io).

## Architecture

- **Azure Resource Group**: Container for all resources
- **Azure Container Instance**: Runs the Flask app container with public IP
- **Health Checks**: Liveness and readiness probes on `/health` endpoint

## Prerequisites

1. Azure CLI installed and logged in
2. Terraform installed (>= 1.11.0)
3. Docker image published to GHCR.io

## Usage

1. Copy the example variables file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Update `terraform.tfvars` with your values:
   ```hcl
   subscription_id = "your-azure-subscription-id"
   name_prefix     = "your-prefix"
   docker_image    = "ghcr.io/your-username/your-repo:tag"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan the deployment:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Outputs

After successful deployment, you'll get:
- `flask_app_url`: The public URL to access your Flask app
- `flask_app_fqdn`: The fully qualified domain name
- `flask_app_ip`: The public IP address

## Publishing Docker Image to GHCR.io

1. Build your image:
   ```bash
   cd ../webapp
   docker build -t flask-hello-world .
   ```

2. Tag for GHCR:
   ```bash
   docker tag flask-hello-world ghcr.io/your-username/terraform-infra-demo:latest
   ```

3. Login to GHCR:
   ```bash
   echo $GITHUB_TOKEN | docker login ghcr.io -u your-username --password-stdin
   ```

4. Push the image:
   ```bash
   docker push ghcr.io/your-username/terraform-infra-demo:latest
   ```

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy
```

## Cost Optimization

The configuration uses minimal resources:
- Azure Container Instance with 0.5 CPU and 1GB RAM
- Public IP for direct access
- No load balancer or additional networking components

This setup is ideal for development, testing, or small-scale applications.
