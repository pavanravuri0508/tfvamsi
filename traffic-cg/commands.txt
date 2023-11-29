
terraform init -backend-config=dev.backend.tfvars

terraform plan -var-file=dev.tfvars

terraform apply -var-file=dev.tfvars
