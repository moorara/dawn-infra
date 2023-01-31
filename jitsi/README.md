# Jitsi Meet

TBD

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

Once your server is up and running, ssh into your server
and install the [Jitsi Meet](https://jitsi.github.io/handbook/docs/intro/) as follows:

```bash
$ cd <name>
$ ssh -F config <name>
...
$ apt install jitsi-meet
```

### Configuration

#### Prosody

##### Enable Authentication

First open `/etc/prosody/conf.avail/<your_domain>.cfg.lua` file and find the following lines:

```lua
VirtualHost "<your_domain>"
    authentication = "anonymous"
```

Then, change them to the following:

```diff
VirtualHost "<your_domain>"
-     authentication = "anonymous"
+     authentication = "internal_hashed"
```

This configurations restricts the room creation to only registered users with a *username* and *password*.

##### Enable Anonymous Login for Guests

In the same file (`/etc/prosody/conf.avail/<your_domain>.cfg.lua`), add the following lines:

```diff
+ VirtualHost "guest.<your_domain>"
+    authentication = "anonymous"
+    c2s_require_encryption = false
```

This configuration allows any user to join conference rooms that an authenticated user created.
The guest users does not need to be registered users; however they need a unique URL and an optional password.

The `guest.<your_domain>` is internal to Jitsi, and you do not need to create a DNS record for it,
or generate an SSL/TLS certificate, or do any web server configuration.

#### Jitsi Meet

Open `/etc/jitsi/meet/<your_domain>-config.js` file and add the following:

```diff
var config = {
    hosts: {
        domain: '<your_domain>',
+       anonymousdomain: 'guest.<your_domain>',
        ...
    },
    ...
}
```

This configuration tells Jitsi Meet what internal hostname to use for the un-authenticated guests.

While in this file, also make the following changes (this is a bug and it may get fixed at some point in future):

```diff
var config = {
+   flags: {
+       sourceNameSignaling: true,
+       sendMultipleVideoStreams: true,
+       receiveMultipleVideoStreams: true,
+   },
    ...
}
...
- config.flags.sourceNameSignaling = true;
- config.flags.sendMultipleVideoStreams = true;
- config.flags.receiveMultipleVideoStreams = true;
```

#### Jicofo

Open `/etc/jitsi/jicofo/jicofo.conf` file and add the following lines:

```diff
jicofo {
+   authentication: {
+     enabled: true
+     type: XMPP
+     login-url: <your_domain>
+   }
  ...
}
````

When using *token-based authentication*, the type must use `JWT` as the scheme instead:

```diff
jicofo {
+   authentication: {
+     enabled: true
+     type: JWT
+     login-url: <your_domain>
+   }
  ...
}
```

Now, Jitsi Meet is configured to require authenticated users for room creation.

### User Creation

Run `prosodyct` to create a user in Prosody:

```bash
$ sudo prosodyctl register <username> <your_domain> <password>
```

Finally, restart *prosody*, *jicofo*, and *jitsi-videobridge2* as follows:

```bash
$ systemctl restart prosody
$ systemctl restart jicofo
$ systemctl restart jitsi-videobridge2
```

## Resources

  - [Prosody](https://prosody.im)
      - [Configuring Prosody](https://prosody.im/doc/configure)
      - [Authentication](https://prosody.im/doc/authentication)
  - [Jitsi Meet](https://jitsi.org/jitsi-meet)
      - [Security](https://jitsi.org/security)
  - [Jitsi as a Service](https://jaas.8x8.vc)
  - **Applications**
      - [Web](https://meet.jit.si)
      - [iOS](https://apps.apple.com/us/app/jitsi-meet/id1165103905)
      - [Android](https://play.google.com/store/apps/details?id=org.jitsi.meet)
      - [Chrome Extension](https://chrome.google.com/webstore/detail/jitsi-meetings/kglhbbefdnlheedjiejgomgmfplipfeb)
  - **Repositories**
      - [jitsi-meet](https://github.com/jitsi/jitsi-meet)
      - [docker-jitsi-meet](https://github.com/jitsi/docker-jitsi-meet)
      - [jitsi-meet-electron](https://github.com/jitsi/jitsi-meet-electron)
  - [Handbook](https://jitsi.github.io/handbook)
      - [Architecture](https://jitsi.github.io/handbook/docs/architecture)
      - **Self-Hosted Deployment**
          - [Requirements](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-requirements)
          - [Debian/Ubuntu](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-quickstart)
          - [Docker](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-docker)
          - [Manual](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-manual)
      - **Configurations**
          - [Authentication](https://jitsi.github.io/handbook/docs/devops-guide/secure-domain)
          - [Scalable Setup](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-scalable)
      - [Video Tutorials](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-videotutorials)
