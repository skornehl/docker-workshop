@title[We are ...]

@snap[north-west]
### We are ...
@snapend

@snap[west sidebar]
#### Armin Halim-Schneider
__Operations Engineer__ <br/><br/>
@fa[arrow-right] Docker <br/>
@fa[arrow-right] Kubernetes <br/>
@fa[arrow-right] Ansible <br/>
@fa[arrow-right] CI/CD <br/>
@fa[arrow-right] AWS <br/>
@snapend

@snap[east sidebar]
#### Sebastian Kornehl
__Operations Engineer__ <br/><br/>
Docker @fa[arrow-left] <br/>
Kubernetes @fa[arrow-left] <br/>
Ansible @fa[arrow-left] <br/>
CI/CD @fa[arrow-left] <br/>
AWS @fa[arrow-left] <br/>
@snapend

+++
@title[Agenda]

@snap[north-west]
### Agenda Day 1
@ul[](false)
- Big Picture
- Architecture
- Typical Workflow
- Registries
- Network
- Best Practices
@ulend
@snapend

+++
@title[Goal]

@snap[north-west]
### Goal of this workshop
@snapend

@snap[west span-100]
Gaining good understanding of Docker Ecosystem </br> </br>

Beeing prepared to start developing with Docker </br> </br>

Use as much as possible ship and container pictures
@snapend

+++
@title[Motivation]

@snap[north-west]
### Motivation
@snapend
![docker_apps_changing](template/img/docker_apps_changing.jpg)

+++
@title[Why Containers?]

@snap[north-west]
### Why Containers?
@snapend

@snap[west span-100]
@ul[](false)
- Containers are a standard format<br/>
- Easily portable across environment<br/>
- Packages up software binaries and dependencies<br/>
- Isolates software from each other<br/>
- Ecosystem has developed around containers<br/>
@ulend
@snapend

+++
@title[What is a Container?]

@snap[north-west]
### What is a Container?
@snapend
![systems_comparison](template/img/systems_comparison.jpg)

+++
@title[Why should devs care? #1]

@snap[north-west]
### Why should devs care? 1/3
@snapend

@snap[west span-100]
@ul[](false)
- A fast, clean, safe, hygienic and portable runtime
- Ensures all team members are using exactly the same tools
- Ensures the build server is using exactly the same tools
@ulend
@snapend


+++
@title[Why should devs care? #2]

@snap[north-west]
### Why should devs care? 2/3
@snapend

@snap[west span-100]
@ul[](false)
- No missing dependencies, packages and other pain points
- Own isolated container, various versions of libraries
- Automate testing, integration, packaging
@ulend
@snapend

+++
@title[Why should devs care? #3]

@snap[north-west]
### Why should devs care? 3/3
@snapend

@snap[west span-100]
@ul[](false)
- Reduce concerns about compatibility on platforms
- Easy service deploymenty
- Allows local development
- It allows me to experiment with support technology without having pollute my development machine 
@ulend
@snapend

+++
@title[Why should ops care?]

@snap[north-west]
### Why should ops care? 1/2
@snapend

@snap[west span-100]
<br/>
@ul[](false)
- Make lifecycle more efficient, consistent and repeatable
- Increase the quality of code produced by devs
- Eliminate inconsistencies between dev, test, prod and customer environments
@ulend
@snapend



+++
@title[Why should ops care? #2]

@snap[north-west]
### Why should ops care? 2/2
@snapend

@snap[west span-100]
<br/>
@ul[](false)
- Support segregation of duties
- Significantly improve the speed and reliability of CI/CD
- Lightweight, address significant performance issues, deployment costs
@ulend
@snapend
