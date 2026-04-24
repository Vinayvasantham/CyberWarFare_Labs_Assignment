# Task 1: Server Setup and SSH Configuration

## Objective

I configured secure SSH access to the Linux server using passwordless key-based authentication.

## Files Included

- sshd_cyberwar.conf

## Configuration Steps

1. Install and start SSH server:

   sudo apt-get update
   sudo apt-get install -y openssh-server
   sudo systemctl enable ssh
   sudo systemctl restart ssh

2. Create key pair for user vinay (if not already present):

   ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa

3. Authorize public key for passwordless login:

   mkdir -p ~/.ssh
   chmod 700 ~/.ssh
   cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
   chmod 600 ~/.ssh/authorized_keys

4. Harden SSH configuration (disable password authentication):

   sudo mkdir -p /etc/ssh/sshd_config.d
   sudo cp sshd_cyberwar.conf /etc/ssh/sshd_config.d/99-cyberwar.conf
   sudo sshd -t
   sudo systemctl restart ssh

5. Connect to the server using SSH key authentication:

   ssh -i ~/.ssh/id_rsa vinay@<server_ip>

   For local VM test:

   ssh -i ~/.ssh/id_rsa vinay@localhost

6. Verify effective SSH settings:

   sudo sshd -T | grep -E 'passwordauthentication no|pubkeyauthentication yes|permitrootlogin no'
   ls -l ~/.ssh/id_rsa ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys

## Executed Commands (Reference)

- sudo apt-get update
- sudo apt-get install -y openssh-server
- ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
- cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
- sudo cp sshd_cyberwar.conf /etc/ssh/sshd_config.d/99-cyberwar.conf
- ssh -i ~/.ssh/id_rsa vinay@<server_ip>
- sudo systemctl enable ssh
- sudo systemctl restart ssh

## Expected Output

- Public key exists in ~/.ssh/authorized_keys
- PasswordAuthentication is disabled
- PubkeyAuthentication is enabled
- Login works with SSH key without password prompt
