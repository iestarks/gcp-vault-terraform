gcp_region="us-east1"
gcp_project_id="gcp-tf-372321"

resource_name_prefix = "gcp-vault-"

###Consul
consul_server_cluster_name="vault-consol-clus-1"
shutdown_script = "../scripts/shutdown-script.sh"
consul_server_source_image ="ubuntu-1804-lts"

######Vault 
vault_cluster_name ="vault-node"
ssl_certificate_name  = "vault-xxxxxxxxxxxxxxxx"
vault_license_filepath = "/Users/user/Downloads/vault.hclic"
leader_tls_servername  = "vault.server.com"

#tls_secret_id =  
