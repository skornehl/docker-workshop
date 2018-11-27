---?image=template/img/compose.jpeg

@title[Docker compose]

@snap[north text-white]
## Docker Compose
@snapend

+++
@title[Overview]

@snap[north-west]
### Overview
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/)
@snapend

@snap[west span-100]
@ul[](false)
- Tool for defining and running multi-container applications
- YAML based
- Useful for development, testing, and staging environments, as well as CI workflows
- Parametrized with ENV variables
@ulend
@snapend

+++
@title[Use Cases]

@snap[north-west]
### Use Cases
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#common-use-cases)
@snapend

__Development environments:__
* running web apps in an isolated environment is crucial
* the Compose file allows to document service dependencies
* multi-page “developer getting started guides” can be avoided

+++
@title[Use Cases]

@snap[north-west]
### Use Cases
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#common-use-cases)
@snapend

__Automated testing environments:__
* create & destroy isolated testing environments easily
 
__Single host deployments:__
* deploy to a remote Docker Engine or Swarm cluster

+++
@title[Features]

@snap[north-west]
### Features
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#features)
@snapend

__Multiple isolated environments on a single host__
A project name can used to isolate environments, e.g.:

**Dev host**: multiple copies of single env (= feature branch names)
**CI server**: do not allow builds to interfer (= unique build number)
**Shared host**: prevent different projects which may use same service names from interfering with each other

+++
@title[Features]

@snap[north-west]
### Features
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#features)
@snapend

__Preserve volume data when containers are created__
When docker-compose up runs it finds any containers from previous runs and copies the volumes from the old container to the new container

__Only recreate containers that are changed__
When a services restarts and nothing has changed Compose re-uses existing containers because it caches the configuration that was used to create a container

+++
@title[Features]

@snap[north-west]
### Features
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#features)
@snapend

__Variables and moving a compostion between environments__
Variables in the Compose file can be used to customize your composition for different environments or users.<br/>
Inheritance is support by using the extends field or by creating multiple Compose files.

+++
@title[Process]

@snap[north-west]
### Process
@snapend

@snap[west span-100]
1. Define your app environment via Dockerfile (if needed)
2. Define services in docker-compose.yml file
3. Run docker-compose up
@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west split-screen-heading text-orange span-50]
@ol[split-screen-list](false)
* Create Wordpress application with MySQL
* Connect from localhost 
@olend
@snapend

@snap[east text-white span-45]
```
version: '3'

services:
   <service-1>:
     image: <image>
     restart: <restart policy>
     environment:
       <List of env variable>

   <service-1>:
     depends_on:
       - <service-1>
     image: <image>
     ports:
       - <ports to be exposed>
```
@snapend