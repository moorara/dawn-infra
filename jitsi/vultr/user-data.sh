#!/bin/bash

# Install Tools
apt update
apt upgrade -y
apt install -y curl unzip jq socat net-tools python3-pygments

# Add Prosody
curl -s https://prosody.im/files/prosody-debian-packages.key -o prosody-debian-packages.key
gpg --output /usr/share/keyrings/prosody-keyring.gpg --dearmor prosody-debian-packages.key
echo "deb [signed-by=/usr/share/keyrings/prosody-keyring.gpg] http://packages.prosody.im/debian $(lsb_release -sc) main" > /etc/apt/sources.list.d/prosody.list
rm prosody-debian-packages.key

# Add Jitsi Meet
curl -s https://download.jitsi.org/jitsi-key.gpg.key -o jitsi-key.gpg.key
gpg --output /usr/share/keyrings/jitsi-key.gpg --dearmor jitsi-key.gpg.key
echo "deb [signed-by=/usr/share/keyrings/jitsi-key.gpg] https://download.jitsi.org stable/" > /etc/apt/sources.list.d/jitsi-stable.list
rm jitsi-key.gpg.key

# Install Jitsi Meet
apt update
apt install -y lua5.2
