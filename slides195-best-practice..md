# Best practices {bg=#000;assets/img/best-practice.jpeg}

# Best practices

##
Containers should be ephemeral

##
Run only one process per container

##
Avoid installing unnecessary packages

##
Use a .dockerignore file

##
Use small base images

##
Minimize the number of layers

##
Group common operations

##
Order of the statements matters

##
Use tags

##
Sort mult-line arguments and indent 4 spaces
```
RUN apt-get update && apt-get install --yes \
    cvs \
    git \
    mercurial \
    subversion
```

## CACHING
Use whenever possible, saves time

## CACHING
Disable with
```
docker build --no-cache=true -t NAME:TAG .
```

## CHECKSUMS
For ADD and COPY the contents of the file(s) in the image are examined and a checksum is calculated for each file

## CHECKSUMS
NO CACHE LOOKUP: All other commands are not evaluted on a file level to determine a cache match/hit

## FROM
use current official Repositories,
e.g. Debian is tightly controlled and kept minimal: 150 mb

## RUN
split long or complex RUN statements on multiple lines
```
RUN command-part-1 \
    command-part-2 \
    command-part-3
```

_Avoid apt-get upgrade or apt-get dist-upgrade_


## Versions
CACHE BUSTING: Always combine
```
RUN apt-get update && apt-get install -y …
```

## Versions
VERSION PINNING: forces the build to retrieve a particular version

##
alway use the list format
```
CMD ["executable", "param1", "param2", …]
```

_with ENTRYPOINT as a kind of default parameter_

## Expose
use the common, traditional port for your application

## Env
- Update path to ensure commands work: 
    ```
    ENV PATH /usr/local/nginx/bin:$PATH
    ```
- Provide needed env vars for services eg. Postgres PGDATA
- Use for version numbers and pathes (like constant vars)

## Copy
- Beware of using ADD instead of COPY
- COPY only supports the basic copying of local files
 
## Copy
FEWER CACHE INVALIDATIONS: Reuse multiple COPY steps individually

```dockerfile
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/
```

## Add
TAR AUTO-EXTRACTION

Because image size matters, using ADD to fetch packages from remote URLs is strongly discouraged

## Clean up commands

```
# Kill all running containers
docker kill $(docker ps -q)
```

## Clean up commands

```
# Delete all stopped containers (including data-only containers)
docker rm $(docker ps -a -q)
```

## Clean up commands

```
# Remove all containers:
docker rm -f $(docker ps -a -q)
```

## Clean up commands

```
# Remove dangling images:
docker rmi $(docker images -q -f dangling=true)
```

## Clean up commands

```
# Remove all images
docker rmi $(docker images -q)
```

## Clean up commands

```
# Remove all unused images, not just dangling ones
docker image prune -a -f
```

## Clean up commands

```
# Remove all unused containers, volumes, networks and images
# e.g. both dangling and unreferenced
docker system prune
```

## Clean up commands

```
# Remove all stopped containers
docker container prune
```