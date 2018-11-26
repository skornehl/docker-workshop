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
- Build Cache
  - CHECKSUMS: For ADD and COPY the contents of the file(s) in the image are examined and a checksum is calculated for each file.
  - NO CACHE LOOKUP: All other commands are not evaluted on a file level to determine a cache match/hit.

+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
<br/>

- **FROM**: use current official Repositories,
    e.g. Debian is tightly controlled and kept minimal: 150 mb.
- **RUN**: split long or complex RUN statements on multiple lines separated
  ```
  RUN command-1 \
    command-2 \
    command-3
    ```
- **Avoid** RUN apt-get upgrade or dist-upgrade
+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
<br/>
- **RUN** apt-get update
  - **CACHE BUSTING**: Always combine RUN apt-get update && apt-get install -y 
- **VERSION PINNING** forces the build to retrieve a particular version
- **CMD**
    - alway use this format:
    ```CMD ["executable", "param1", "param2"…]```
    - with ENTRYPOINT is a kind of default parameter
+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
- **EXPOSE**: 
    - use the common, traditional port for your application
    - For container linking, Docker provides environment variables (ie, MYSQL_PORT_3306_TCP)
+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
- **ENV**
    - Update path to ensure commands work:
    ```
    ENV PATH /usr/local/nginx/bin:$PATH
    ```
    - Provide needed env vars for services eg. Postgres PGDATA
    - Use for version numbers and pathes (like constant vars)
+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
- **COPY**
    - Beware of using ADD instead of COPY
    - COPY only supports the basic copying of local files
    - FEWER CACHE INVALIDATIONS: Reuse multiple COPY steps individually.
    ```
    COPY requirements.txt /tmp/
    RUN pip install --requirement /tmp/requirements.txt
    COPY . /tmp/
    ```

+++

@title[Guidelines]

@snap[north-west]
### Best Practices
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#the-dockerfile-instructions) 
@snapend
- **ADD**
    - TAR AUTO-EXTRACTION
    - Because image size matters, using ADD to fetch packages from remote URLs is strongly discouraged
