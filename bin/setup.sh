#!/bin/bash

set -e

# move into repository's root
cd "$(dirname "$0")/.."

echo "=== Setup Start ==="

# Install Ansible
if ! command -v ansible &> /dev/null; then
    echo "Ansible not found. Installing..."
    sudo apt update
    sudo apt install -y ansible
else
    echo "Ansible is already installed."
fi

# execute Playbook
# パスが "ansible/..." になっている点に注目してください
echo "Running Ansible Playbook..."
ansible-playbook -i ansible/inventory/hosts ansible/local.yml --ask-become-pass

echo "=== Setup Finished! ==="
