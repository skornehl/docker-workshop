# Start nginx
docker run -d --name web1 -p 8080:80 nginx

# Test Access
curl localhost:8080

# Log into container
docker exec -ti web1 bash
> ls -al

# Read the logs
docker logs web1

# inspect
docker inspect web1 | less

# Cleanup
docker stop web1
docker rm web1