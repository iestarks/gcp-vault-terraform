
locals {
   subnetwork             = "https://www.googleapis.com/compute/v1/projects/${var.gcp_project_id}/${var.gcp_region}/subnetworks/subnet-01"
   tls_secret_id          = "terraform_example_module_vault_tls_secret"
   leader_tls_servername  = "vault.server.com"
   ssl_certificate_name = ""
   network_name = "vault-vpc"
}