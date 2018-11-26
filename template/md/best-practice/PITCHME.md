---?image=template/img/best-practice.jpeg

@title[Docker Compose]

@snap[north]
## Best Practices
@snapend

+++

@title[Build]

@snap[north-west]
### CLI reference 
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices) <br/>
@box[bg-gray rounded](Dockerfile: Guidelines)
@snapend
<br/>

@ul[](false)
- Containers should be ephemeral
- Use a .dockerignore file
- Use small base images
- Use tags
- Group common operations
- Avoid installing unnecessary packages
- Run only one process per container
- Minimize the number of layers
- Order of the statements matters
- Sort mult-line arguments and indent 4 spaces:
```
RUN apt-get update && apt-get install --yes \
    cvs \
    git \
    mercurial \
    subversion
```
@ulend