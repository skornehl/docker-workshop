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

@snap[west span-100]
@ul[](false)
Development environments:
* running web apps in an isolated environment is crucial
* the Compose file allows to document service dependencies
* multi-page “developer getting started guides” can be avoided

Automated testing environments
* create & destroy isolated testing environments easily
 
Single host deployments
* deploy to a remote Docker Engine or Swarm cluster
* production-readiness of Docker Compose is coming
@ulend
@snapend