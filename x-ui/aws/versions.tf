# https://developer.hashicorp.com/terraform/language/settings
# https://developer.hashicorp.com/terraform/language/expressions/version-constraints

terraform {
  # Root modules should constraint both a lower and upper bound on versions for each provider.
  required_version = "~> 1.8"

  required_providers {
    # https://registry.terraform.io/providers/hashicorp/local/latest/docs
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
    # https://registry.terraform.io/providers/hashicorp/random/latest/docs
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    # https://registry.terraform.io/providers/hashicorp/tls/latest/docs
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    # https://registry.terraform.io/providers/vancluever/acme/latest/docs
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.21"
    }
    # https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.30"
    }
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46"
    }
  }
}
