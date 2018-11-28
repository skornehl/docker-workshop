---?image=template/img/run.jpeg

@title[Typical Local Workflow with CLI]

@snap[north text-white span-100]
@fa[terminal fa-2x](Typical Local Workflow with CLI)
@snapend



+++
@title[CLI reference - images]

@snap[north-west]
### CLI reference - images
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/cli/) 
@snapend

Parameter | Description
--------- | -------------
pull | Pulls image from registry
push | Pushes image to registry
rmi  | Remove image



+++
@title[CLI reference - containers]

@snap[north-west]
### CLI reference - containers
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/cli/) 
@snapend

Parameter | Description
--------- | -------------
run  | Start container
exec | Execute within running container
stop | Stop container
rm   | Remove container

+++
@title[CLI reference - RUN 1/2]

@snap[north-west]
### CLI reference - RUN 1/2
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
--rm | Remove container after run



+++
@title[CLI reference - RUN 2/2]

@snap[north-west]
### CLI reference - RUN 2/2
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/run/) <br/>
@box[bg-gray rounded](docker run [OPTIONS] IMAGE[:Tag] [COMMAND])
@snapend
<br/>
<br/>

Parameter | Description
------------ | -------------
-p | Expose a port (Host:Container)
-v | Mount a volume (Host:Container)




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
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Pull nginx:latest container from dockerhub
- Run a nginx container with name 'web1' and exposed port 8080
- Try to access it from Host machine with curl
- Log into container and list directories
@olend
@snapend

+++?code=template/md/cli/first-container.sh?lang=sh
@title[Answer]
@snap[north-west]
### Exercise (Answer)
@snapend

@[1-2]
@[4-5]
@[7-8]
@[10-12]
@[14-16]

+++
@title[CLI reference - CONTROLS]

@snap[north-west]
### CLI reference - CONTROLS
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
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Run a nginx container with name 'web1' and exposed port 8080
- Try to access it from Host machine with curl and follow access logs
- Find out IP of the running container
- Monitor memory consumption of web1
@olend
@snapend

+++?code=template/md/cli/monitoring.sh?lang=sh
@title[Answer]
@snap[north-west]
### Exercise (Answer)
@snapend

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
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Build a Dockerfile which replaces /usr/share/nginx/html/index.html
- Start and access it
- Optionally: Make dockerhub Account and push it!
@olend
@snapend

+++?code=template/md/cli/index.html?title=index.html
@title[index.html]
@snap[north-west]
### Exercise (Answer)
#### index.html
@snapend

+++?code=template/md/cli/Dockerfile?title=Dockerfile
@title[Dockerfile]
@snap[north-west]
### Exercise (Answer)
#### Dockerfile
@snapend

+++?code=template/md/cli/dockerfile.sh?lang=sh
@title[Answer]
@snap[north-west]
### Exercise (Answer)
@snapend

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
@snap[north-west]
### Dockerfile, multistage
@snapend

```bash
FROM golang:1.7.3 as builder
WORKDIR /go/src/github.com/alexellis/href-counter/
RUN go get -d -v golang.org/x/net/html
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/github.com/alexellis/href-counter/app .
CMD ["./app"]
```
@[1-5]
@[7-11]

+++?code=template/md/cli/busybox-static?lang=sh
@snap[north-west]
### FROM scratch
@snapend
@snap[north-east]
### [@fa[info]](https://github.com/docker-library/busybox/blob/master/uclibc/Dockerfile.builder)
@snapend
@[7-12]
@[13-17]
@[19-21]
@[27]
@[30-33]
