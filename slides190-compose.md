# Docker Compose {bg=#000;assets/img/compose.jpeg}

# Docker Compose

## Overview
- Tool for defining and running multi-container applications
- YAML based
- Useful for development, testing, and staging environments, as well as CI workflows
- Parametrized with ENV variables

## Use Cases
- running web apps in an isolated environment is crucial
- the Compose file allows to document service dependencies
- multi-page "developer getting started guides" can be avoided
- This presentation ;-)

## Use Cases

__Automated testing environments:__<br/>
- create & destroy isolated testing environments easily<br/>
__Single host deployments:__<br/>
- deploy to a remote Docker Engine or Swarm cluster

## Features
__Multiple isolated environments on a single host__<br/>
A project name can used to isolate environments, e.g.:<br/>
<br/>
**Dev host**: multiple copies of single env (= feature branch names)<br/>
**CI server**: do not allow builds to interfer (= unique build number)<br/>
**Shared host**: prevent different projects which may use same service names from interfering with each other

## Features
__Preserve volume data when containers are created__<br/>
When docker-compose up runs it finds any containers from previous runs and copies the volumes from the old container to the new container<br/>

## Features
__Only recreate containers that are changed__<br/>
When a services restarts and nothing has changed Compose re-uses existing containers because it caches the configuration that was used to create a container

## Features

__Variables for moving a composition between environments__<br/>
Variables in the Compose file can be used to customize your composition for different environments or users.<br/>
Inheritance is support by using the extends field or by creating multiple Compose files.

## Process
- Define your app environment via Dockerfile (if needed)
- Define services in docker-compose.yml file
- Run docker-compose up

## Troubleshooting

Parameter | Description
------------ | -------------
events | Receive real time events from containers
exec | Execute a command in a running container
logs | View output from containers
top | Display the running processes

## YAML

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

## Example
- Create Wordpress application with MySQL
- Connect from localhost 

## Example (Answer)
```yaml
version: '3.3'

services:
   db:
     image: mysql:5.7
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
```

## Exercise
- Are the containers deleted after finishing the process?
- Run the environment in background (-d)
- Tear down the services. Are the containers now deleted?

## Exercise
- Start the application and sign in
- Is your account stored after restart?
- Mount a volume into the db container
  Use a local folder
  The folder to be mounted is `/var/lib/mysql`
- Start the application and sign in
- After restart the data should not get lost

## Exercise (Answer)
```yaml
version: '3.3'

services:
   db:
     image: mysql:5.7
     volumes:
       - .:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
```

## Exercise
- Define a volume in the docker-compose.yml
- Replace the local folder with the volume name
- Start the application
- List all volumes and inspect the newly created
- Tear down the application
- Delete the volume
- Start the application
- Is your data still available?

##  Exercise (Answer)
```yaml
version: '3.3'

services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
volumes:
    db_data:
```

