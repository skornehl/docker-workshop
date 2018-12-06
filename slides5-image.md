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

# Dockerfile

- A text document
- Contains ordered commands 
- Basis to build new images


# Dockerfile reference 1/2

Parameter | Description
------------ | -------------
FROM | Sets the base image
RUN | Runs bash command while building
ADD | Copies new files, directories or remote file URLs
COPY | Copies new files and directories
EXPOSE | Informs Docker about listening Ports

# Dockerfile reference 2/2

Parameter | Description
------------ | -------------
ENV | Sets environment variable
CMD | Provide defaults for an executing container
ENTRYPOINT | Allows to configure a container that will run as an executable
USER | Switches the user
WORKDIR | Switches the default working dir

# CLI reference 

Parameter | Description
------------ | -------------
--add-host | Adds /etc/hosts entry
--build-arg | Build-time variables
-f | Filename (default: Dockerfile)
-t | Set Tag

# Example
1. Build a Dockerfile which replaces 
    ```
    /usr/share/nginx/html/index.html
    ```
    in nginx container
2. Start and access it

# Example (Answer) 1/3
Create local file: index.html
```{style="width: 40%;"}
<h1>Hello docker</h1>
```

# Example (Answer) 2/3
Create local file: Dockerfile
```
FROM nginx:1.15.6-alpine
LABEL maintainer="no@spam.pls"
COPY index.html /usr/share/nginx/html/
```

# Example (Answer) 3/3
```
# Build
docker build -t nginx:local .
```

# Exercise
1. Modify Dockerfile to be based on ubuntu
2. Let Dockerfile install nginx (apt-get)
3. EXPOSE port 80
4. Set default CMD to start nginx

# Exercise (Answer)
```
FROM ubuntu
LABEL maintainer="no@spam.pls"

RUN apt-get update && apt-get install nginx
COPY index.html /usr/share/nginx/html/
EXPOSE 80

CMD ["nginx"]
```

# Dockerfile - multistage

```
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

# Dockerfile - FROM scratch 1/2 

```
#!/usr/bin/env bash
set -e

rootfsDir="$1"
shift

busybox="$(which busybox 2>/dev/null || true)"
if [ -z "$busybox" ]; then
	echo >&2 'error: busybox: not found'
	echo >&2 '  install it with your distribution "busybox-static" package'
	exit 1
fi
if ! ldd "$busybox" 2>&1 | grep -q 'not a dynamic executable'; then
	echo >&2 "error: '$busybox' appears to be a dynamic executable"
	echo >&2 '  you should install your distribution "busybox-static" package instead'
	exit 1
fi

mkdir -p "$rootfsDir/bin"
rm -f "$rootfsDir/bin/busybox" # just in case
cp "$busybox" "$rootfsDir/bin/busybox"

(
	cd "$rootfsDir"

	IFS=$'\n'
	modules=( $(bin/busybox --list-modules) )
	unset IFS

	for module in "${modules[@]}"; do
		mkdir -p "$(dirname "$module")"
		ln -sf /bin/busybox "$module"
	done
)
```
# Dockerfile - FROM scratch 1/2 

```
FROM scratch
COPY bin /
CMD ["sh"]
```

