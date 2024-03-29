#!/bin/sh

# This script install the necessary tool on the instance to provision a kubernetes cluster

# Install CFSSL

wget -q --show-progress --https-only --timestamping \
  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssl \
  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssljson

chmod +x cfssl cfssljson
sudo mv cfssl cfssljson /usr/local/bin/

# Install kubectl

wget https://storage.googleapis.com/kubernetes-release/release/v1.21.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install Az CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
