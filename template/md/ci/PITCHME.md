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
@ul[](false)
- Start jenkins in docker
- Connect to it using your browser
- Add a freestyle job with a shell command
- Build it
- Look at the console output
@ulend
@snapend

+++
@title[Answer]

```
# Run Jenkins
docker run -d --rm -p 8080:8080 --env JAVA_OPTS="-Djenkins.install.runSetupWizard=false" jenkins
```