#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./monitoring-script.sh [container_name] [log_dir]
# Example:
#   ./monitoring-script.sh cyberwarlabs-web /opt/container-monitor/logs

CONTAINER_NAME="${1:-cyberwarlabs-web}"
LOG_DIR="${2:-/opt/container-monitor/logs}"
LOG_FILE="${LOG_DIR}/container_usage.log"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

mkdir -p "${LOG_DIR}"

STATS="$(docker stats --no-stream --format '{{.CPUPerc}},{{.MemUsage}}' "${CONTAINER_NAME}" 2>/dev/null || true)"

if [[ -z "${STATS}" ]]; then
  echo "${TIMESTAMP},container=${CONTAINER_NAME},status=not-running" >> "${LOG_FILE}"
  exit 0
fi

CPU_USAGE="${STATS%%,*}"
MEM_USAGE="${STATS#*,}"

echo "${TIMESTAMP},container=${CONTAINER_NAME},cpu=${CPU_USAGE},mem=${MEM_USAGE}" >> "${LOG_FILE}"
