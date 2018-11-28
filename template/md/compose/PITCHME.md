---?image=template/img/compose.jpeg

@title[Docker compose]

@snap[north text-white span-100]
@fa[terminal fa-2x](Docker Compose)
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
@ul[](false)
- running web apps in an isolated environment is crucial
- the Compose file allows to document service dependencies
- multi-page "developer getting started guides" can be avoided
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
__Automated testing environments:__<br/>
@ul[](false)
- create & destroy isolated testing environments easily
@ulend
__Single host deployments:__<br/>
@ul[](false)
- deploy to a remote Docker Engine or Swarm cluster
@ulend
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
@ol[](false)
- Define your app environment via Dockerfile (if needed)
- Define services in docker-compose.yml file
- Run docker-compose up
@olend

@snapend

+++
@title[Troubleshooting]

@snap[north-west]
### Troubleshooting
@snapend

Parameter | Description
------------ | -------------
events | Receive real time events from containers
exec | Execute a command in a running container
logs | View output from containers
top | Display the running processes

@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west]
@ol[](false)
- Create Wordpress application with MySQL
- Connect from localhost 
@olend
@snapend

+++
@title[Hint]

@snap[north-west]
### Hint
@snapend

```yaml
version: '3.3'

services:
   <db>:
     image: <image>
     restart: <restart policy>
     environment:
       <List of env variable>

   <service>:
     depends_on:
       - <db>
     image: <image>
     ports:
       - <ports to be exposed>
```
+++?code=template/md/compose/wordpress-compose.1.yml?lang=yaml&title=Answer
@title[Answer]

@[1]
@[3]
@[4-11]
@[13-23]

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west]
@ol[](false)
- Are the containers deleted after finishing the process?
- Run the environment in background (-d)
- Tear down the services. Are the containers now deleted?
@olend
@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west]
@ol[](false)
- Start the application and sign in
- Is your account stored after restart?
- Mount a volume into the db container
  Use a local folder
  The folder to be mounted is `/var/lib/mysql`
- Start the application and sign in
- After restart the data should not get lost
@olend
@snapend

+++?code=template/md/compose/wordpress-compose.2.yml?lang=yaml&title=Answer
@title[Answer]

@[3-13]
@[7]

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west]
@ol[](false)
- Define a volume in the docker-compose.yml
- Replace the local folder with the volume name
- Start the application
- List all volumes and inspect the newly created
- Tear down the application
- Delete the volume
- Start the application
- Is your data still available?
@olend
@snapend

+++?code=template/md/compose/wordpress-compose.yml?lang=yaml&title=Answer
@title[Answer]

@[3-13]
@[7]
@[26-27]

+++?code=template/md/compose/docker-volume.sh?lang=sh&title=Answer
@title[Answer]

@[1-2]
@[4-5]
@[7-8]
@[10-11]
