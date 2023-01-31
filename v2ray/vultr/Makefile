terraform.tfvars:
	@ echo 'name                  = ""'    >  terraform.tfvars;
	@ echo 'domain                = ""'    >> terraform.tfvars;
	@ echo 'acme_email            = ""'    >> terraform.tfvars;
	@ echo 'cloudflare_api_token  = ""'    >> terraform.tfvars;
	@ echo 'vultr_api_key         = ""'    >> terraform.tfvars;
	@ echo 'vultr_instance_region = "fra"' >> terraform.tfvars;

.PHONY: clean
clean:
	@ rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
