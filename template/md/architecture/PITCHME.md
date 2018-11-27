---?image=template/img/architecture.jpeg

@title[Docker Architecture]

@snap[north]
## Docker Architecture
@snapend

+++
@title[Runtime]

@snap[north-west]
### Components
@snapend

@snap[west span-100]
@ul[](false)
- Docker server/daemon (_dockerd_)
- Docker client/CLI (_docker_)
- Docker registries
- Docker objects: images, containers, networks, volumes, services
@ulend
@snapend

+++
@title[Registries]

@snap[north-west]
### Registries
@snapend

@snap[west span-100]
Docker Hub (service, public/private)<br/>
vs. Docker Registry (free, CLI only)<br/>
vs. Docker Trusted Registry (enterprise)<br/>
@snapend

+++
@title[Other]

@snap[north-west]
### Other
@snapend

@snap[west span-100]
Docker Store (beta, commercial)<br/>
Docker Cloud (service, depends on providers)<br/>
vs. Docker Datacenter with DTR & UCP (enterprise)<br/>
@snapend

+++
@title[Docker Engine]

@snap[north-west]
### Docker Engine
@snapend
![engine-components-flow](template/img/engine-components-flow.png)

+++
@title[How it fits together]

@snap[north-west]
### How it fits together
@snapend
![architecture](template/img/architecture.png)