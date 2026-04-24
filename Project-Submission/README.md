# DevOps Intern Assignment Submission

This repository contains my submission for all five tasks in the assignment.

I completed the tasks manually in the terminal. I have documented exactly what I ran and how I verified each result in the task-level README files.

## Repository Layout

Project-Submission/
- Task-1/
- Task-2/
- Task-3/
- Task-4/
- Task-5/

## Suggested Execution Order

1. Complete Task-1 (SSH setup).
2. Complete Task-2 (Docker deployment).
3. Complete Task-4 (monitoring user and permissions).
4. Complete Task-3 (automated monitoring with cron).
5. Complete Task-5 (firewall hardening).

## Environment Used

- OS: Ubuntu 22.04+ (or any Debian-based Linux)
- Privileges: sudo/root required for system-level steps
- Docker Engine installed in Task-2

## Quick Verification Checklist

- SSH key login works and password login is disabled.
- Docker container is running and app is reachable on http://SERVER_IP:8000
- Monitoring logs are generated every minute in /opt/container-monitor/logs/
- Monitoring folder is only accessible to dedicated monitoring user.
- UFW allows only required ports and restricted SSH source IP.

## Video Walkthrough Scope

My walkthrough video demonstrates:

- SSH passwordless authentication
- Docker deployment and app access on port 8000
- Monitoring logs with timestamps and CPU/memory values
- Monitoring user access controls
- Firewall rules and verification
