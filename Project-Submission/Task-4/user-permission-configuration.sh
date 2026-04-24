#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   sudo ./user-permission-configuration.sh [monitor_user]
# Example:
#   sudo ./user-permission-configuration.sh monitorops

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo/root."
  exit 1
fi

MONITOR_USER="${1:-monitorops}"
BASE_DIR="/opt/container-monitor"
LOG_DIR="${BASE_DIR}/logs"

useradd -m -s /bin/bash "${MONITOR_USER}" 2>/dev/null || true

if getent group docker >/dev/null 2>&1; then
  usermod -aG docker "${MONITOR_USER}"
fi

mkdir -p "${LOG_DIR}"
chown -R "${MONITOR_USER}:${MONITOR_USER}" "${BASE_DIR}"
chmod 700 "${BASE_DIR}"
chmod 700 "${LOG_DIR}"

echo "Configured user '${MONITOR_USER}' and secured ${BASE_DIR}."
