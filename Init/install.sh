#!/bin/sh

# This script install the necessary tool on the instance to provision a kubernetes cluster

# Install CFSSL

VERSION=$(curl --silent "https://api.github.com/repos/cloudflare/cfssl/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
VNUMBER=${VERSION#"v"}
wget https://github.com/cloudflare/cfssl/releases/download/${VERSION}/cfssl_${VNUMBER}_linux_amd64 -O cfssl
chmod +x cfssl
sudo mv cfssl /usr/local/bin

# Install kubectl

wget https://storage.googleapis.com/kubernetes-release/release/v1.21.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install Az CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
