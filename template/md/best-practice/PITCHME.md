---?image=template/img/best-practice.jpeg

@title[Docker Compose]

@snap[north text-white span-100]
@fa[terminal fa-2x](Best Practices)
@snapend

+++
@title[Best Practices]
@snap[north-west]
### Best Practices - ephemeral
@snapend
@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)
@snapend
Containers should be ephemeral


+++
@title[Best Practices]
@snap[north-west]
### Best Practices - one process
@snapend
Run only one process per container


+++
@title[Best Practices]
@snap[north-west]
### Best Practices - size matters
@snapend
Avoid installing unnecessary packages

Use a .dockerignore file

Use small base images

Minimize the number of layers


+++
@title[Best Practices]
@snap[north-west]
### Best Practices - order things
@snapend
Group common operations

Order of the statements matters

Use tags


+++
@title[Best Practices]
@snap[north-west]
### Best Practices - split
@snapend
Sort mult-line arguments and indent 4 spaces
```
RUN apt-get update && apt-get install --yes \
    cvs \
    git \
    mercurial \
    subversion
```


+++
@title[Best Practices]
@snap[north-west]
### Best Practices - build cache
@snapend
CACHING: Use whenever possible. Saves time.

DISABLE: ```docker build --no-cache=true -t NAME:TAG .```


+++
@title[Best Practices]
@snap[north-west]
### Best Practices - Build Cache
@snapend
CHECKSUMS: For ADD and COPY the contents of the file(s) in the image are examined and a checksum is calculated for each file.

NO CACHE LOOKUP: All other commands are not evaluted on a file level to determine a cache match/hit.


+++
@title[Guidelines]
@snap[north-west]
### Best Practices - from
@snapend
use current official Repositories,
e.g. Debian is tightly controlled and kept minimal: 150 mb.



+++
@title[Guidelines]
@snap[north-west]
### Best Practices - run
@snapend
split long or complex RUN statements on multiple lines
```
RUN command-part-1 \
    command-part-2 \
    command-part-3
```

_Avoid apt-get upgrade or apt-get dist-upgrade._


+++
@title[Guidelines]
@snap[north-west]
### Best Practices - versions
@snapend
CACHE BUSTING: Always combine </br>`RUN apt-get update && apt-get install -y …`

VERSION PINNING: forces the build to retrieve a particular version



+++
@title[Guidelines]
@snap[north-west]
### Best Practices - cmd
@snapend
alway use the list format:</br>
`CMD ["executable", "param1", "param2", …]`

_with ENTRYPOINT as a kind of default parameter_


+++
@title[Guidelines]
@snap[north-west]
### Best Practices - expose
@snapend
use the common, traditional port for your application

+++
@title[Guidelines]
@snap[north-west]
### Best Practices - env
@snapend
- Update path to ensure commands work: </br>
    ```ENV PATH /usr/local/nginx/bin:$PATH```
- Provide needed env vars for services eg. Postgres PGDATA
- Use for version numbers and pathes (like constant vars)



+++
@title[Guidelines]
@snap[north-west]
### Best Practices - copy
@snapend
Beware of using ADD instead of COPY

COPY only supports the basic copying of local files

FEWER CACHE INVALIDATIONS: Reuse multiple COPY steps individually.

```dockerfile
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/
```


+++
@title[Guidelines]
@snap[north-west]
### Best Practices - add
@snapend
TAR AUTO-EXTRACTION

Because image size matters, using ADD to fetch packages from remote URLs is strongly discouraged
+++

@title[Clean Up]

@snap[north-west]
### Clean up commands
@snapend

```
# Kill all running containers
docker kill $(docker ps -q)

# Delete all stopped containers (including data-only containers)
docker rm $(docker ps -a -q)

# Remove all containers:
docker rm -f $(docker ps -a -q)

# Remove dangling images:
docker rmi $(docker images -q -f dangling=true)

# Remove all images
docker rmi $(docker images -q)

# Remove all unused images, not just dangling ones
docker image prune -a -f

# Remove all unused containers, volumes, networks and images
# e.g. both dangling and unreferenced
docker system prune

# Remove all stopped containers
docker container prune
```
@[1-2]
@[4-5]
@[7-8]
@[10-11]
@[13-14]
@[16-17]
@[19-21]
@[23-25]
