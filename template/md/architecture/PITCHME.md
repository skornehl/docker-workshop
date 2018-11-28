---?image=template/img/architecture.jpeg
@title[Docker Architecture]

@snap[north text-black span-100]
@fa[terminal fa-2x](Docker Architecture)
@snapend

+++
@title[Definition]

@snap[north-west]
### Definition
@snapend

@snap[west span-100]
Image: a file, comprised of multiple layers<br/><br/>

Container: (a running software package, which is based on an image)?
@snapend
+++

@title[Compared to VM]

@snap[north-west]
### Compared to VM
@snapend
![systems_comparison](template/img/systems_comparison.jpg)

+++
@title[Runtimes]

@snap[north-west]
### Runtimes
@snapend

@snap[west span-100]
@ul[](false)
- Docker Engine (_Docker Inc._)
- rkt (_CoreOS_)
@ulend
@snapend

+++
@title[Docker Engine]

@snap[north-west]
### Docker Engine
@snapend

@snap[west span-100]
@ul[](false)
- Client-Server Application
- REST API
- Server CLI: _dockerd_
- Client CLI: _docker_
- Also manages _volume_ and _network_
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
### Docker Registry
@snapend

@snap[west span-100]
@ul[](false)
- Server application
- Store and distribute images
- With REST API
- Example: Docker Hub
@ulend
@snapend

+++
@title[How it fits together]

@snap[north-west]
### How it fits together
@snapend
![architecture](template/img/architecture.png)
