# Run Jenkins
docker run \
  -d --rm -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock
  -e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" \
  jenkins/jenkins:alpine
