module "vault" {
  source               = "../terraform-gcp-vault-ent-starter"


  /* # The shared DNS SAN of the TLS certs being used
  leader_tls_servername  = local.leader_tls_servername
  #Your GCP project ID
  project_id             = var.gcp_project_id
  # Prefix for uniquely identifying GCP resources
  resource_name_prefix   = var.resource_name_prefix 
  # Self link of the subnetwork you wish to deploy into
  subnetwork             = local.subnetwork
  # Name of the SSL Certificate to be used for Vault LB
  ssl_certificate_name   = local.ssl_certificate_name 
  # Secret id/name given to the google secret manager secret
  tls_secret_id          = local.tls_secret_id  */


  subnetwork                  = module.vpc.subnets_names[0]
  resource_name_prefix        = var.resource_name_prefix  
  vault_license_filepath      = var.vault_license_filepath  
  project_id                  = var.gcp_project_id           
  ssl_certificate_name        = var.ssl_certificate_name           
  tls_secret_id               = var.tls_secret_id         
  leader_tls_servername       = var.leader_tls_servername  
 
}


module "vpc" {
    source  = "../terraform-google-network/modules/subnets"
    project_id   = var.gcp_project_id
    network_name = local.network_name

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name                  = "subnet-03"
            subnet_ip                    = "10.10.30.0/24"
            subnet_region                = "us-west1"
            subnet_flow_logs             = "true"
            subnet_flow_logs_interval    = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling    = 0.7
            subnet_flow_logs_metadata    = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_filter_expr = "true"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "192.168.64.0/24"
            },
        ]

        subnet-02 = []
    }
}

/* module "vpc" {
    source  = "../terraform-google-network/modules/vpc"
    project_id   = var.gcp_project_id
    network_name = local.network_name
    routing_mode = "GLOBAL"
   # subnets      = module.terraform-google-network.subnets
} */
