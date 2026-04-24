# Task 2: Docker Installation and Application Deployment

## Objective

I installed Docker, built an image for the custom index.html file, ran a container, and exposed the app on port 8000.

## Files Included

- Dockerfile
- index.html

## Configuration Steps

1. Install and start Docker:

   sudo apt-get update
   sudo apt-get install -y docker.io
   sudo systemctl enable docker
   sudo systemctl start docker

2. Build image:

   sudo docker build -t cyberwarlabs-web:latest .

3. Remove old container if it exists:

   sudo docker rm -f cyberwarlabs-web 2>/dev/null || true

4. Run container and expose on port 8000:

   sudo docker run -d --name cyberwarlabs-web -p 8000:80 --restart unless-stopped cyberwarlabs-web:latest

5. Verify container and access app:

   sudo docker ps --filter name=cyberwarlabs-web
   curl -s http://127.0.0.1:8000 | head

6. Access the app in browser:

   http://SERVER_IP:8000

## Executed Commands (Reference)

- sudo apt-get update
- sudo apt-get install -y docker.io
- sudo systemctl enable docker
- sudo systemctl start docker
- docker build -t cyberwarlabs-web:latest .
- docker run -d --name cyberwarlabs-web -p 8000:80 --restart unless-stopped cyberwarlabs-web:latest

## Expected Output

- Docker container should be running.
- Browser should show deployment success page on port 8000.
- curl output should return the HTML page content.
