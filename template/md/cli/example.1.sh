# Start nginx
docker run -d --name web1 -p 8080:80 nginx

# Retrieve Logs
docker logs --follow web1

# Test Access. Open second shell
curl localhost:8080

# Find out IP
docker inspect -f  "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" web1
# Alternative:
docker inspect web1 | grep IPAddress

# Memory Consumtion
docker stats web1

# Cleanup
docker stop web1
docker rm web1