# Task 5: Firewall Configuration

## Objective

I configured UFW firewall rules to restrict unauthorized traffic while allowing required services.

## Files Included

- firewall-configuration.sh

## Configuration Steps

1. Install UFW:

   chmod +x firewall-configuration.sh
   sudo ./firewall-configuration.sh <YOUR_PUBLIC_IP>

   Example used during testing:

   sudo ./firewall-configuration.sh 49.43.235.183

2. Verify firewall:

   sudo ufw status numbered
   sudo ufw status verbose
   sudo iptables -L -n -v

## Executed Commands (Reference)

- sudo apt-get update
- sudo apt-get install -y ufw
- sudo ufw default deny incoming
- sudo ufw default allow outgoing
- sudo ufw allow from <ALLOWED_IP> to any port 22 proto tcp
- sudo ufw allow 80/tcp
- sudo ufw allow 8000/tcp
- sudo ufw --force enable
- sudo ufw status numbered

## Expected Outcome

- SSH allowed only from specified IP.
- HTTP (80) and app port (8000) open.
- All other inbound traffic denied.
- UFW status shows active with the required allow rules.
