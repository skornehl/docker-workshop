# Start registry
docker run -d -p 5000:5000 --name registry registry:2

# Pull Alpine
docker pull alpine

# Tag the image
docker image tag alpine localhost:5000/myfirstimage

# Push it
docker push localhost:5000/myfirstimage

# Test the pull
docker pull localhost:5000/myfirstimage

#Cleanup
docker container stop registry 
docker container rm -v registry
