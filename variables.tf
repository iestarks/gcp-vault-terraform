# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  description = "The name of the GCP Project where all resources will be launched."
  type        = string
}

variable "gcp_region" {
  description = "The region in which all GCP resources will be launched."
  type        = string
}

variable "resource_name_prefix" {
  description = "The resource prefix name"
  type        = string
}

variable "consul_server_source_image" {
  description = "The Google Image used to launch each node in the Consul Server cluster."
  type        = string
}

variable "vault_cluster_name" {
  description = "The name of the Vault Server cluster. All resources will be namespaced by this value. E.g. vault-server-prod"
  type        = string
}


variable "consul_server_cluster_name" {
  description = "The name of the Consul Server cluster. All resources will be namespaced by this value. E.g. consul-server-prod"
  type        = string
}

variable "shutdown_script" {
  description = "The name of the Consul Server cluster. All resources will be namespaced by this value. E.g. consul-server-prod"
  type        = string
}






