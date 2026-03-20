#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "==== K8s Host Preparation Script ===="

# Enable IPv4 and IPv6 Forwarding
SYSCTL_CONF="/etc/sysctl.d/k8s.conf"
if [[ ! -f "$SYSCTL_CONF" ]] || ! grep -q "net.ipv4.ip_forward = 1" "$SYSCTL_CONF"; then
    echo "Enabling IPv4 and IPv6 forwarding..."
    cat <<EOF | sudo tee "$SYSCTL_CONF" > /dev/null
# Kubernetes requires IP forwarding
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
EOF
    sudo sysctl --system
else
    echo "IPv4/IPv6 forwarding already enabled in $SYSCTL_CONF"
fi

# Disable Swap
FSTAB_FILE="/etc/fstab"
if grep -q "swap" "$FSTAB_FILE" && ! grep -q "^#.*swap" "$FSTAB_FILE"; then
    echo "Disabling swap..."
    sudo sed -i.bak '/^\s*\/swap.img\s\+none\s\+swap/s/^/#/' "$FSTAB_FILE"
    sudo swapoff -a
else
    echo "Swap is already disabled or commented in $FSTAB_FILE"
fi

# System Update
echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "==== Host preparation completed successfully! ===="