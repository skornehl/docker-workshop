---?image=template/img/run.jpeg

@title[Docker CLI]

@snap[north]
## Docker CLI
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
ps | List containers
images | List images
info | Display system-wide information
inspect | Return low-level information on Docker objects
logs | Fetch the logs of a container
stats | Display a live stream of container(s) resource usage statistics

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
- Run a nginx container with name 'web1' and exposed port 8080
- Try to access it from Host machine with curl
- Log into container and list directories
- Try to read logs and inspect container
@ulend
@snapend

+++?code=template/md/cli/example.sh?lang=sh&title=Solution
@title[Solution]

@[1-2]
@[4-5]
@[7-9]
@[11-12]
@[14-15]
@[17-20]
