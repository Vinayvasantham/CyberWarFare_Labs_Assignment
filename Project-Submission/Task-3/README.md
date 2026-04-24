# Task 3: Container Resource Monitoring with Timestamp Logs

## Objective

I configured automatic monitoring to capture Docker container CPU and memory usage with timestamps every minute and store logs in /opt/container-monitor/logs/.

## Files Included

- monitoring-script.sh

## Configuration Steps

1. Ensure dedicated monitoring user and folder exist (Task-4 first), including docker group access for the monitoring user.
2. Create log directory with restricted ownership:

   sudo mkdir -p /opt/container-monitor/logs
   sudo chown -R monitorops:monitorops /opt/container-monitor
   sudo chmod 700 /opt/container-monitor
   sudo chmod 700 /opt/container-monitor/logs

3. Create cron file for 1-minute monitoring:

   chmod +x monitoring-script.sh
   sudo cp monitoring-script.sh /opt/container-monitor/monitoring-script.sh
   sudo chown monitorops:monitorops /opt/container-monitor/monitoring-script.sh
   sudo chmod 750 /opt/container-monitor/monitoring-script.sh

   sudo tee /etc/cron.d/container-monitor >/dev/null <<'EOF'
   * * * * * monitorops /opt/container-monitor/monitoring-script.sh cyberwarlabs-web /opt/container-monitor/logs >/dev/null 2>&1
   EOF
   sudo chmod 644 /etc/cron.d/container-monitor

4. Restart cron service:

   sudo systemctl restart cron || sudo systemctl restart crond

5. Validate cron and logs:

   sudo cat /etc/cron.d/container-monitor
   sudo -u monitorops /opt/container-monitor/monitoring-script.sh cyberwarlabs-web /opt/container-monitor/logs
   sudo tail -n 10 /opt/container-monitor/logs/container_usage.log

## Executed Commands (Reference)

- docker stats --no-stream --format '{{.CPUPerc}},{{.MemUsage}}' cyberwarlabs-web
- sudo cp monitoring-script.sh /opt/container-monitor/monitoring-script.sh
- sudo tee /etc/cron.d/container-monitor
- sudo systemctl restart cron

## Expected Outcome

- Automatic log entries every minute with timestamp, CPU %, and memory usage.

