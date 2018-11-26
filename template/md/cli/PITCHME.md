---?image=template/img/run.jpeg

@title[Typical Local Workflow with CLI]

@snap[north]
## Typical Local Workflow with CLI
@snapend

+++
@title[CLI reference]

@snap[north-west]
### CLI reference 
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/cli/) 
@snapend

Parameter | Description
------------ | -------------
pull | Pulls image from registry
push | Pushes image to registry
run | Start container
stop | Stop container
rm | Remove container
rmi | Remove image

+++
@title[CLI reference - RUN]

@snap[north-west]
### CLI reference - RUN
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/run/) <br/>
@box[bg-gray rounded](docker run [OPTIONS] IMAGE[:Tag] [COMMAND])
@snapend
<br/>
<br/>

Parameter | Description
------------ | -------------
--name | unique Name for container
-d | Detach container
-it | Interactive terminal with pseudo-TTY
-p | Expose a port (Host:Container)
--rm | Remove container after run

+++
@title[CLI reference - EXEC]

@snap[north-west]
### CLI reference - EXEC
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/exec/) <br/>
@box[bg-gray rounded](docker exec [OPTIONS] IMAGE[:Tag] [COMMAND])
@snapend
<br/>
<br/>

Parameter | Description
------------ | -------------
-d | Detach container
-it | Interactive terminal with pseudo-TTY

+++
@title[Try it]

@snap[north-west]
### Try it
@snapend

@snap[west span-100]
@ul[](false)
- Pull nginx:latest container from dockerhub
- Run a nginx container with name 'web1' and exposed port 8080
- Try to access it from Host machine with curl
- Log into container and list directories
@ulend
@snapend

+++?code=template/md/cli/first-container.sh?lang=sh&title=Solution
@title[Solution]

@[1-2]
@[4-5]
@[7-8]
@[10-12]
@[14-16]

+++
@title[CLI reference]

@snap[north-west]
### CLI reference 
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/cli/) 
@snapend

Parameter | Description
------------ | -------------
ps | List containers
images | List images
info | Display system-wide information
inspect | Return low-level information
logs | Fetch the logs of a container
stats | Display container resource usage statistics

+++
@title[Try it]

@snap[north-west]
### Try it
@snapend

@snap[west span-100]
@ul[](false)
- Run a nginx container with name 'web1' and exposed port 8080
- Try to access it from Host machine with curl and follow access logs
- Find out IP of the running container
- Monitor memory consumption of web1
@ulend
@snapend

+++?code=template/md/cli/monitoring.sh?lang=sh&title=Solution
@title[Solution]

@[1-2]
@[4-5]
@[7-8]
@[10-13]
@[15-16]
@[18-20]

+++
@title[Dockerfile]

@snap[north-west]
### Dockerfile
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/builder/) 
@snapend

Parameter | Description
------------ | -------------
FROM | Sets the base image
RUN | Runs bash command while building
ADD | Copies new files, directories or remote file URLs
COPY | Copies new files and directories
EXPOSE | Informs Docker about listening Ports
ENV | Sets environment variable

+++
@title[Build]

@snap[north-west]
### CLI reference 
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/exec/) <br/>
@box[bg-gray rounded](docker build [OPTIONS] PATH | URL | -)
@snapend
<br/>
<br/>

Parameter | Description
------------ | -------------
--add-host | Adds /etc/hosts entry
--build-arg | Build-time variables
-f | Filename (default: Dockerfile)
-t | Set Tag

+++
@title[Try it]

@snap[north-west]
### Try it
@snapend

@snap[west span-100]
@ul[](false)
- Build a Dockerfile which replaces /usr/share/nginx/html/index.html
- Start and access it
- Optionally: Make dockerhub Account and push it!
@ulend
@snapend

+++?code=template/md/cli/index.html?title=index.html
@title[index.html]

+++?code=template/md/cli/Dockerfile?title=Dockerfile
@title[Dockerfile]

+++?code=template/md/cli/dockerfile.sh?lang=sh&title=Solution
@title[Solution]

@[1-2]
@[4-5]
@[7-8]
@[10-13]
@[15-18]

+++
@title[Layer]

@snap[north-west]
### Layer
@snapend
![layer](template/img/layers.png)

+++
@title[Images]

@snap[north-west]
### Images
@snapend

@snap[west span-100]
@ul[](false)
- Keep it small
- Only one runtime per container
- Use pipes, remove layers after developing
- Use .dockerignore if needed
@ulend
@snapend

+++?code=template/md/cli/Dockerfile-multistage?title=Dockerfile-multistage
@title[Dockerfilem-ultistage]
@[1-5]
@[7-11]