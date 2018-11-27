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
- Java/Web based
- De facto standard
- Job as DSL
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
- Start jenkins in docker
- Connect to it using your browser
- Add a freestyle job _hello_ with a shell command
```
echo hello world!
```
- Build it
- Look at the console output
@olend
@snapend

+++?code=template/md/ci/run-jenkins.sh&language=sh&title=Answer
@title[Answer]

@[2]
@[3]
@[4]
@[5]

+++
@title[Docker Pipeline]

@snap[north-west]
### Using Docker with Jenkins Pipeline
@snapend

@snap[west span-100]
@ul[](false)
- Pipeline as code (_Jenkinsfile_)
- Built-in support for Docker
- Use Docker images as the execution environment
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
- Start jenkins in docker using custom image
- Connect to it using your browser
- Add a pipeline job _test_ with a pipeline script
- Build it
- Look at the console output
@olend
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

+++?code=template/md/ci/Jenkinsfile&language=groovy&title=Jenkinsfile
@snap[north-east]
### [@fa[info]](https://jenkins.io/doc/book/pipeline/docker/) <br/>
@snapend

@[1,12]
@[2-4]
@[5,11]
@[6-10]
