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

@snap[west]
__Development environments:__<br/>
* running web apps in an isolated environment is crucial
* the Compose file allows to document service dependencies
* multi-page “developer getting started guides” can be avoided
@snapend

+++
@title[Use Cases]

@snap[north-west]
### Use Cases
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#common-use-cases)
@snapend

@snap[west]
__Automated testing environments:__<br/>
* create & destroy isolated testing environments easily
 <br/>
__Single host deployments:__<br/>
* deploy to a remote Docker Engine or Swarm cluster
@snapend

+++
@title[Features]

@snap[north-west]
### Features
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#features)
@snapend

@snap[west]
__Multiple isolated environments on a single host__<br/>
A project name can used to isolate environments, e.g.:<br/>
<br/>
**Dev host**: multiple copies of single env (= feature branch names)<br/>
**CI server**: do not allow builds to interfer (= unique build number)<br/>
**Shared host**: prevent different projects which may use same service names from interfering with each other
@snapend

+++
@title[Features]

@snap[north-west]
### Features
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#features)
@snapend

@snap[west]
__Preserve volume data when containers are created__<br/>
When docker-compose up runs it finds any containers from previous runs and copies the volumes from the old container to the new container<br/>
<br/>
__Only recreate containers that are changed__<br/>
When a services restarts and nothing has changed Compose re-uses existing containers because it caches the configuration that was used to create a container
@snapend

+++
@title[Features]

@snap[north-west]
### Features
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/compose/overview/#features)
@snapend

@snap[west]
__Variables and moving a compostion between environments__<br/>
Variables in the Compose file can be used to customize your composition for different environments or users.<br/>
Inheritance is support by using the extends field or by creating multiple Compose files.
@snapend

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