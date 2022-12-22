module "vault" {
  source               = "hashicorp/vault-starter/gcp"
  version              = "0.1.0"

  # The shared DNS SAN of the TLS certs being used
  leader_tls_servername  = var.leader_tls_servername
  #Your GCP project ID
  project_id             = var.gcp_project_id
  # Prefix for uniquely identifying GCP resources
  resource_name_prefix   = var.resource_name_prefix 
  # Self link of the subnetwork you wish to deploy into
  subnetwork             = local.subnetwork
  # Name of the SSL Certificate to be used for Vault LB
  ssl_certificate_name   = local.ssl_certificate_name 
  # Secret id/name given to the google secret manager secret
  tls_secret_id          = local.tls_secret_id 
}