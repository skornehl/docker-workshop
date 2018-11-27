---?image=template/img/architecture.jpeg

@title[Docker Architecture]

@snap[north text-black span-100]
@fa[terminal fa-2x](Docker Architecture)
@snapend

+++
@title[Runtime]

@snap[north-west]
### Components
@snapend

@snap[west span-100]
@ul[](false)
- Docker server/daemon (_dockerd_)
- Docker client/CLI (_docker engine_)
- Docker registries
- Docker objects:</br> image, container, network, volume, service
@ulend
@snapend

+++
@title[Docker Engine]

@snap[north-west]
### Docker Engine
@snapend
![engine-components-flow](template/img/engine-components-flow.png)

+++
@title[Registries]

@snap[north-west]
### Registries
@snapend

@snap[west span-100]
@ul[](false)
- Docker Hub (service, public/private)<br/>
- Docker Registry (free, CLI only)<br/>
- Docker Trusted Registry (enterprise)<br/>
@ulend
@snapend

+++
@title[Other]

@snap[north-west]
### Registries (Others)
@snapend

@snap[west span-100]
@ul[](false)
- Docker Store (beta, commercial)<br/>
- Docker Cloud (service, depends on providers)<br/>
- Docker Datacenter with DTR & UCP (enterprise)<br/>
@ulend
@snapend

+++
@title[How it fits together]

@snap[north-west]
### How it fits together
@snapend
![architecture](template/img/architecture.png)
