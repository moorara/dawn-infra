# X-UI

[X-UI](https://seakfind.github.io/2021/10/10/X-UI/) is a web server and UI for [V2Ray](https://www.v2fly.org/en_US/).
It provides a graphical user interface for managing users and accounts.

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

After your server is up and running, you need to do a one-time configuration.

  1. Get the IP address of your server from Terraform output and navigate to `http://<ip_address>`.
      - `terraform output server_ip`
  2. Get the username and password of your panel from Terrform output and log in.
      - `terraform output panel_username`
      - `terraform output panel_password`
  3. Translate the page to "English".
  4. On "system status" page, switch version to the latest version available.
  5. On "panel settings" page and "panel configuration" tab, make the following changes:
      - Enter `443` for "Panel listening port".
      - Enter `/cert/certificate.pem` for "Panel certificate public key file path".
      - Enter `/cert/private_key.pem` for "Panel certificate key file path".
  6. On "user settings" tab, consider changing the password.
  7. On "other settings" tab, you can optionally update the "Time zone".
  8. Click on "save configuration" button and the "restart panel".
  9. You can now find your panel URL by running `terraform output panel_url`

## Management

### Create a WebSocket VPN

  1. Go to your server web panel, log in, and translate on to English.
  2. Navigate to "inbound list" page.
  3. Click on `+` button.
      1. Enter name in "remkar" field.
      2. Choose `vmess` for "protocol".
      3. Enter an **unused** port number between `3000` and `9999`.
      4. Select `ws` for "transmission".
      5. Clock on "Add to" button.
  4. Click on `operate` link next to your newly created inbound.
      1. Click on "QR code".
      1. Click on "copy" button.
  5. You can now use this code for connecting to this VPN on clinet applications.

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
