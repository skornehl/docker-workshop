---?image=template/img/docker-jenkins.png&size=auto 75%&position=bottom

@title[CI/CD with Docker]

@snap[north text-black span-100]
@fa[terminal fa-2x](CI/CD with Docker)
@snapend

+++
@title[Jenkins]

@snap[north-west]
### Jenkins overview
@snapend

@snap[west span-100]
@ul[](false)
- CI/CD Server
- Java based with Web UI
- De facto standard
- Job as code via Job DSL
- CI/CD pipeline as code via Pipeline DSL
- Many plugins
@ulend
@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Start Jenkins in Docker
- Connect to it using your browser
- Add a freestyle job _hello_ with a shell command
```
echo hello world!
```
- Build it
- Look at the console output
@olend
@snapend

+++
@title[Hints]

@snap[north-west]
### Hints
@snapend

@snap[west span-100]
@ul[](false)
- Image: _jenkins/jenkins:alpine_
- Port: _8080_
- Command: _echo hello world!_
@ulend
@snapend

+++?code=template/md/ci/run-jenkins.sh&language=sh&title=Answer
@title[Answer]

@[2]
@[3]
@[4]
@[5]

+++
@title[Jenkins Pipeline]

@snap[north-west]
### CI/CD pipeline with Jenkins Pipeline
@snapend

@snap[west span-100]
@ul[](false)
- Pipeline plugins suite
- Pipeline definition in _Jenkinsfile_
- Built-in support for Docker
- Use Docker container as the execution environment
- Any tool can be packaged in a Docker container 
@ulend
@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Build a custom image for Jenkins
- Start Jenkins using the custom image
- Install plugin: _workflow-aggregator_
- Connect to it using your browser
- Add a pipeline job _test_ with a pipeline definition
- Build it
- Look at the console output
@olend
@snapend

+++
@title[Hints]

@snap[north-west]
### Hints
@snapend

@snap[west span-100]
@ul[](false)
- Base image: _jenkins/jenkins:alpine_
- Install Docker:
```
USER root
```
<br/>
```
RUN apk --no-cache add docker && rm -rf /var/cache/apk/*
```
- Port: _8080_
- Docker host socket: _/var/run/docker.sock_
- Plugin: _workflow-aggregator_
@ulend
@snapend

+++?code=template/md/ci/Dockerfile&language=dockerfile&title=Dockerfile
@snap[north-east]
### [@fa[info]](https://github.com/jenkinsci/docker/blob/master/README.md) <br/>
@snapend

@[1]
@[3]
@[5-6]

+++?code=template/md/ci/run-custom-jenkins.sh&language=sh&title=run-custom-jenkins.sh

@[4]
@[5]

+++?code=template/md/ci/Jenkinsfile&language=groovy&title=Jenkinsfile
@snap[north-east]
### [@fa[info]](https://jenkins.io/doc/book/pipeline/docker/) <br/>
@snapend

@[1,12]
@[2-4]
@[5,11]
@[6-10]
