# Docker image

```render_ditaa
                  +-----------------+                                            +-----------------+
                  |                 |                                            |  cGRE           |
                  |    CONTAINER    +-----MANAGES---+           +----MANAGES-----+      IMAGE      |
                  |                 |               |           |                |                 |
                  +-----------------+               |           |                +-----------------+
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                   +----------------+-----------+-----------------+
                                   | {o} cCCC           CLIENT                    |
                                   |                  docker CLI                  |
+-----------------+                |    +------------------------------------+    |                +-----------------+
|                 |                |    | {o} cCCC     REST API              |    |                |                 |
|     NETWORK     |                |    |                                    |    |                |      VOLUME     |
|                 |                |    |    +--------------------------+    |    |                |                 |
+--------+--------+                |    |    |{o} cCCC                  |    |    |                +--------+--------+
         |                         |    |    |          SERVER          |    |    |                         |
         |                         |    |    |                          |    |    |                         |
         +--------MANAGES----------+    |    |       docker daemon      |    |    +--------MANAGES----------+
                                   |    |    |                          |    |    |
                                   |    |    |                          |    |    |
                                   |    |    +--------------------------+    |    |
                                   |    +------------------------------------+    |
                                   +----------------------------------------------+

```

# Definition
- The basis of a container
- Ordered collection of root FS changes
- Includes execution parameters
- Stateless

# CLI reference

Parameter | Description
--------- | -------------
pull | Pulls image from registry
push | Pushes image to registry
rmi  | Remove image

# Example
Pull ubuntu image from dockerhub
```{style="width: 40%;"}
docker pull ubuntu:latest
```

# Example (Answer)
```
latest: Pulling from library/ubuntu
32802c0cfa4d: Pull complete 
da1315cffa03: Pull complete 
fa83472a3562: Pull complete 
f85999a86bef: Pull complete 
Digest: sha256:6d0e0c26489e33f5a6f0020edface2727db9489744ecc9b4f50c7fa671f23c49
Status: Downloaded newer image for ubuntu:latest
```

# Exercise
Pull alpine image from dockerhub with tag 3.7

# Exercise (Answer)
```
$ docker pull alpine:3.7
3.7: Pulling from library/alpine
c67f3896b22c: Pull complete 
Digest: sha256:a52b4edb6240d1534d54ee488d7cf15b3778a5cfd0e4161d426c550487cddc5d
Status: Downloaded newer image for alpine:3.7
```

# CLI reference - image

Parameter | Description
--------- | -------------
build | Build an image from a Dockerfile
history | Show the history of an image
inspect | Display detailed information
ls  | List images
tag | Create a tag TARGET_IMAGE

# Example
Compare size of containers
```{style="width: 40%;"}
docker image ls
```
or
```{style="width: 40%;"}
docker images
```

# Example (Answer)

```
REPOSITORY   TAG       IMAGE ID        CREATED         SIZE
ubuntu       latest    93fd78260bd1    2 weeks ago     86.2MB
alpine       3.7       34ea7509dcad    2 months ago    4.21MB
```

<!-- # Dockerfile

- A test file 

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
-t | Set Tag -->