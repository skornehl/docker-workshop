---?image=template/img/best-practice.jpeg

@title[Docker Compose]

@snap[north]
## Best Practices
@snapend

+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)
@snapend
<br/>

- Containers should be ephemeral
- Use a .dockerignore file
- Use small base images
- Use tags
- Group common operations
- Avoid installing unnecessary packages
- Run only one process per container
- Minimize the number of layers
- Order of the statements matters

+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### <br/>[@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)
@snapend
<br/>
- Sort mult-line arguments and indent 4 spaces:
```
RUN apt-get update && apt-get install --yes \
    cvs \
    git \
    mercurial \
    subversion
```
- Build Cache
  - CACHING: Use whenever possible. Saves time.
  - DISABLE: ```docker build --no-cache=true -t NAME:TAG .```

+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### <br/>[@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices)
@snapend
<br/>
  @size[60%](- CHECKSUMS: For ADD and COPY the contents of the files in the image are examined and a checksum is calculated for each file. During the cache lookup, the checksum is compared against the checksum in the existing images. Cache is invalid if anything has changed - besides file access dates!)
  @size[60%](- NO CACHE LOOKUP: All other commands are not evaluted on a file level to determine a cache match/hit. Just the command string itself is used to find a match when processing files updated in the container, e.g. RUN apt-get -y update.)

+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
<br/>

@ul[](false)
Dockerfile: Instructions
- FROM: use current official Repositories,
    e.g. Debian is tightly controlled and kept minimal: 150 mb.
- RUN: split long or complex RUN statements on multiple lines separated
```RUN command-1 \
    command-2 \
    command-3```
3. Avoid RUN apt-get upgrade or dist-upgrade
     as many of the “essential” packages from the base images
     won’t upgrade inside an unprivileged container.
Best Practices
Dockerfile: Instructions
4. RUN apt-get update

CACHE BUSTING: Always combine RUN apt-get update && apt-get install -y .... Using apt-get update alone in a RUN statement causes caching issues and subsequent apt-get install instructions fail.
 FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y curl
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y curl ngnix
VERSION PINNING: forces the build to retrieve a particular version regardless of what’s in the cache. new versions cause a cache bust of apt-get update.
RUN apt-get update && apt-get install 
    package-foo=1.3.* \
    s3cmd=1.1.* \
Best Practices
Dockerfile: Instructions
5. CMD

alway use this format:
CMD ["executable", "param1", "param2"…]
CMD ["apache2","-DFOREGROUND"]
CMD ["perl", "-de0"]
CMD ["python"]
CMD ["php", "-a"]
CMD in cooperation with ENTRYPOINT is a kind of default parameter, if docker run provides no further parameters
. EXPOSE

use the common, traditional port for your application, e.g.
EXPOSE 80 # Apache 
EXPOSE 27017 # MongoDB
For container linking, Docker provides environment variables for the path from the recipient container back to the source (ie, MYSQL_PORT_3306_TCP)






@ulend