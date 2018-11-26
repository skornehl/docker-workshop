# Build
docker build -t nginx:local .

# Run
docker run -d --name web1 -p 8080:80 nginx:local

# Test Access
curl localhost:8080

# Push
docker login
docker tag nginx:local <USERNAME>/nginx
docker push <USERNAME>/nginx

# Cleanup
docker stop web1
docker rm web1
docker rmi nginx:local