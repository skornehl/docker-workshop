# Pull container
docker pull nginx:latest

# Start nginx
docker run -d --name web1 -p 8080:80 nginx:latest

# Test Access
curl localhost:8080

# Log into container
docker exec -ti web1 bash
> ls -al

# Cleanup
docker stop web1
docker rm web1