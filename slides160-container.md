# Docker container {bg=#000;assets/img/container.jpeg}
# Docker container 
##
```render_ditaa
                  +-----------------+                                            +-----------------+
                  | cGRE            |                                            | cCCC            |
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

## Definition

- Runtime instance of a docker image
- Consists of
  - Docker image
  - An execution environment
  - A standard set of instructions

## CLI reference

Parameter | Description
--------- | -------------
run  | Start container
exec | Execute within running container
stop | Stop container
rm   | Remove container

## CLI reference - run

Parameter | Description
------------ | -------------
--name | unique Name for container
-d | Detach container
-it | Interactive terminal with pseudo-TTY
--rm | Remove container after run

## CLI reference - run

Parameter | Description
------------ | -------------
-p | Expose a port (Host:Container)
-v | Mount a volume (Host:Container)

## Example
Run ubuntu image and list files
```{style="width: 40%;"}
docker run -it --rm ubuntu ls -al
```

## Example (Answer)
```
total 72
drwxr-xr-x   1 root root 4096 Dec  5 12:46 .
drwxr-xr-x   1 root root 4096 Dec  5 12:46 ..
-rwxr-xr-x   1 root root    0 Dec  5 12:46 .dockerenv
drwxr-xr-x   2 root root 4096 Nov 12 20:56 bin
drwxr-xr-x   2 root root 4096 Apr 24  2018 boot
drwxr-xr-x   5 root root  360 Dec  5 12:46 dev
drwxr-xr-x   1 root root 4096 Dec  5 12:46 etc
drwxr-xr-x   2 root root 4096 Apr 24  2018 home

[...]
```

## CLI reference - exec

Parameter | Description
------------ | -------------
-d | Detach container
-it | Interactive terminal with pseudo-TTY

## Example
Run ubuntu image detached
```
docker run -d --rm --name ubuntu ubuntu sleep 120
```
Exec into container and list files
```
docker exec -ti --rm ubuntu ls -al
```

## Example (Answer)
```
total 72
drwxr-xr-x   1 root root 4096 Dec  5 12:46 .
drwxr-xr-x   1 root root 4096 Dec  5 12:46 ..
-rwxr-xr-x   1 root root    0 Dec  5 12:46 .dockerenv
drwxr-xr-x   2 root root 4096 Nov 12 20:56 bin
drwxr-xr-x   2 root root 4096 Apr 24  2018 boot
drwxr-xr-x   5 root root  360 Dec  5 12:46 dev
drwxr-xr-x   1 root root 4096 Dec  5 12:46 etc
drwxr-xr-x   2 root root 4096 Apr 24  2018 home

[...]
```

## Exercise
1. Run your Dockerfile from image exercise
2. Bind container port 80 to local port 8080

## Exercise (Answer)
```
# Run
docker run -d --name web1 -p 8080:80 nginx:local
# Test Access
curl localhost:8080
# Cleanup
docker stop web1
docker rm web1
docker rmi nginx:local
```

## CLI reference - CONTROLS

Parameter | Description
------------ | -------------
ps | List containers
images | List images
info | Display system-wide information
inspect | Return low-level information
logs | Fetch the logs of a container
stats | Display container resource usage statistics

## Example
1. Watch logs on your nginx:local container

    ```
    docker logs --follow web1
    ```
2. Access it!


## Example (Answer)
```
172.17.0.1 - - [05/Dec/2018:13:32:07 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36" "-"
2018/12/05 13:32:07 [error] 8#8: *1 open() "/usr/share/nginx/html/favicon.ico" failed (2: No such file or directory), client: 172.17.0.1, server: localhost, request: "GET /favicon.ico HTTP/1.1", host: "localhost:8082", referrer: "http://localhost:8082/"
172.17.0.1 - - [05/Dec/2018:13:32:07 +0000] "GET /favicon.ico HTTP/1.1" 404 555 "http://localhost:8082/" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36" "-"
172.17.0.1 - - [05/Dec/2018:13:32:11 +0000] "GET / HTTP/1.1" 200 612 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36" "-"

[...]
```

## Exercise

1. Find out IP of web1 container
2. Monitor memory consumption of web1

## Exercise (Answer)

```
# Find out IP
docker inspect -f  \
    "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"\
    web1
# Alternative:
docker inspect web1 | grep IPAddress

# Memory Consumtion
docker stats web1
```

