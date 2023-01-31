terraform.tfvars:
	@ echo 'name                  = ""'             >  terraform.tfvars;
	@ echo 'domain                = ""'             >> terraform.tfvars;
	@ echo 'acme_email            = ""'             >> terraform.tfvars;
	@ echo 'cloudflare_api_token  = ""'             >> terraform.tfvars;
	@ echo 'access_key            = ""'             >> terraform.tfvars;
	@ echo 'secret_key            = ""'             >> terraform.tfvars;
	@ echo 'region                = "me-central-1"' >> terraform.tfvars;
	@ echo 'instance_type         = "t3.micro"'     >> terraform.tfvars;

.PHONY: clean
clean:
	@ rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
