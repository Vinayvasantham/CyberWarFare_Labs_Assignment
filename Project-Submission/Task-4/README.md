# Task 4: Secure Monitoring Logs with Dedicated User

## Objective

I created a dedicated user for monitoring operations and restricted monitoring folder access.

## Files Included

- user-permission-configuration.sh

## Configuration Steps

1. Create dedicated monitoring user:

   chmod +x user-permission-configuration.sh
   sudo ./user-permission-configuration.sh monitorops

2. Verify permissions and access control:

   id monitorops
   sudo ls -ld /opt/container-monitor /opt/container-monitor/logs
   sudo -u monitorops touch /opt/container-monitor/logs/.perm_test && sudo -u monitorops rm -f /opt/container-monitor/logs/.perm_test
   sudo -u nobody ls /opt/container-monitor && echo "unexpected-access" || echo "access-blocked"

## Executed Commands (Reference)

- sudo useradd -m -s /bin/bash monitorops
- sudo usermod -aG docker monitorops
- sudo mkdir -p /opt/container-monitor/logs
- sudo chown -R monitorops:monitorops /opt/container-monitor
- sudo chmod 700 /opt/container-monitor
- sudo chmod 700 /opt/container-monitor/logs

## Expected Outcome

- Monitoring user has full access.
- Other users are blocked from monitoring directory contents.
