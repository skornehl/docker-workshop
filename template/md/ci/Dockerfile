FROM jenkins/jenkins:alpine

RUN /usr/local/bin/install-plugins.sh workflow-aggregator

USER root
RUN apk --no-cache add docker && rm -rf /var/cache/apk/*
