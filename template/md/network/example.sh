# Create Networks
docker network create mytestnet1
docker network create mytestnet2

# Start nginx
docker run -d --name web1 --network mytestnet1 nginx

# Test Isolation
docker run -it --rm --network mytestnet1 alpine \
    bin/sh -c 'apk add curl; curl web1'

docker run -it --rm --network mytestnet2 alpine \
    bin/sh -c 'apk add curl; curl web1'

# Cleanup
docker stop web1
docker rm web1
docker network rm mytestnet1
docker network rm mytestnet2