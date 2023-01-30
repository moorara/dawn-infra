# dawn-infra

This repository contains a handful of [Terraform](https://www.terraform.io) projects
for deploying communication infrastructure for accessing the free Internet! **Stay Hopeful** 🤞

## Prerequisites

### Domain Registration

You should have at least one domain name registered.
You can register any domain name with your provider of choice.

The only consideration is that your domain provider should allow you to
change the [name servers](https://en.wikipedia.org/wiki/Name_server) for your domain
(most domain providers allow that).

### DNS Service

Once you have a domain available,
you can add it to your [Cloudflare](https://www.cloudflare.com) account.

  1. Go to your Cloudflare dashboards [here](https://dash.cloudflare.com).
  1. Click on "Add a Site" button.
  1. Enter your domain name and click "Add site".
  1. Select a plan (*Free* is good enough) and click "Continue".
  1. Click on "Continue" and then "Confirm" (you do not need to add any record).
  1. Record your **Cloudflare name servers**.
      1. Go to your domain administration panel.
      1. Change the name servers for your domain to the **Cloudflare name servers**.
  1. Click on "Done" and then "Finish later".
