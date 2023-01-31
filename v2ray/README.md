# V2Ray

V2Ray is a platform for building proxies to bypass network restrictions.
V2Fly is a community-driven edition of V2Ray.

## Client Applications

  - **iOS**
    - [Fair VPN](https://apps.apple.com/us/app/fair-vpn/id1533873488)
  - **Android**
    - [v2rayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang)

## Quick Start

### Deployment

Create your `terraform.tfvars` file by running the `make terraform.tfvars` command,
and set the required variables inside this file.

Then, run the following commands to deploy your server using [Terraform](https://www.terraform.io).

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

### Configuration

The server config file is located at `/usr/local/etc/v2ray/config.json`.
After making a change to this file, you can run the following to load the new configurations.

```bash
$ sudo systemctl restart v2ray
```

## Resources

  - [Website](https://www.v2fly.org/en_US)
      - [Installation](https://www.v2fly.org/en_US/guide/install.html)
      - [Novice Guide](https://www.v2fly.org/en_US/guide/start.html)
      - [V5 Configs](https://www.v2fly.org/en_US/v5/config/overview.html)
      - [V4 Configs](https://www.v2fly.org/en_US/config/overview.html)
  - **Repositories**
      - [v2ray-core](https://github.com/v2fly/v2ray-core)
      - [fhs-install-v2ray](https://github.com/v2fly/fhs-install-v2ray)
      - [v2ray-examples](https://github.com/v2fly/v2ray-examples)
