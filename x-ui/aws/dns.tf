# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone
data "cloudflare_zone" "domain" {
  name = var.domain
}

# https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record
resource "cloudflare_record" "www_ipv4" {
  zone_id = data.cloudflare_zone.domain.id
  type    = "A"
  name    = local.subdomain
  value   = aws_instance.vpn.public_ip
  ttl     = 1800
}
