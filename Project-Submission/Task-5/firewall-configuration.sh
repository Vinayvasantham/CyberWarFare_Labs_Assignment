#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   sudo ./firewall-configuration.sh <allowed_ssh_source_ip>
# Example:
#   sudo ./firewall-configuration.sh 49.43.235.183

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo/root."
  exit 1
fi

ALLOWED_IP="${1:-}"
if [[ -z "${ALLOWED_IP}" ]]; then
  echo "Usage: sudo ./firewall-configuration.sh <allowed_ssh_source_ip>"
  exit 1
fi

apt-get update
apt-get install -y ufw

ufw --force reset
ufw default deny incoming
ufw default allow outgoing

ufw allow from "${ALLOWED_IP}" to any port 22 proto tcp
ufw allow 80/tcp
ufw allow 8000/tcp

ufw --force enable
ufw status numbered
