---?image=template/img/orchestration.jpeg

@title[Docker Orchestration]

@snap[north text-white span-100]
@fa[terminal fa-2x](Docker Orchestration)
@snapend

+++
@title[Overview]

@snap[north-west]
### Overview - Technologies
@snapend

@snap[west span-100]
@ul[](false)
- Swarm
- Kubernetes (K8S)
- Apache Mesos
@ulend
@snapend

+++
@title[Overview]

@snap[north-west]
### Overview - PaaS
@snapend

@snap[west span-100]
@ul[](false)
- Giant Swarm
- Deis
- Rancher
- Nomad
@ulend
@snapend

+++
@title[Overview]

@snap[north-west]
### Overview - Cloud
@snapend

@snap[west span-100]
@ul[](false)
- EKS
- ECS
- AKS
- GKE
@ulend
@snapend

+++
@title[Docker Swarm]

@snap[north-west]
### Docker Swarm
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/swarm/#feature-highlights) 
@snapend

Cluster management integrated with Docker Engine
Decentralized design
Scaling
Multi-host networking
Service discovery
Load balancing

+++
@title[CLI reference - swarm]

@snap[north-west]
### CLI reference - swarm
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/swarm/reference/swarm/) 
@box[bg-gray rounded](docker run swarm [OPTIONS] COMMAND [arg...])
@snapend
<br/>
Parameter | Description
--------- | -------------
  init | Initialize a swarm
  join | Join a swarm
  leave | Leave the swarm
  update | Update the swarm


+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Go to [www.play-with-docker.com]
- Add 3 nodes
- Initialize master
- Join the other as nodes
- Have a look with `docker node ls`
@olend
@snapend

+++
@title[Answer]
```sh
# Deploy compose file
docker swarm init --advertise-addr=[IP]

# Join Nodes
docker swarm join --token [TOKEN] [IP]:2377

# List Service
docker node ls
```

@[1-2]
@[4-5]
@[7-8]

+++
@title[CLI reference - service 1/2]

@snap[north-west]
### CLI reference - service 1/2
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/service/) 
@box[bg-gray rounded](docker service COMMAND)
@snapend
<br/>
Parameter | Description
--------- | -------------
create | Create a new service
inspect | Display detailed information on one or more services
logs | Fetch the logs of a service or task
ls | List services

+++
@title[CLI reference - service 2/2]

@snap[north-west]
### CLI reference - service 2/2
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/reference/commandline/service/) 
@box[bg-gray rounded](docker service COMMAND)
@snapend
<br/>
Parameter | Description
--------- | -------------
ps | List the tasks of one or more services
rollback | Revert changes to a service's configuration
scale | Scale one or multiple replicated services
update | Update a service

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Upload your docker-compose file with wordpress
- Deploy it into your Swarm cluster
- Find out where your containers are
- Scale wordpress to 3
@olend
@snapend

+++
@title[Answer]
```sh
# Deploy compose file
docker deploy --compose-file=wordpress-compose.yml WORDPRESS

# List local container
docker ps

# List Service
docker service ls

# Scale
docker service scale WORDPRESS_wordpress=3
```

@[1-2]
@[4-5]
@[7-8]
@[10-11]


@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Scale wordpress to 5
- Monitor what happens
- Look where the containers are
- Remove a node
- Monitor what happens
@olend
@snapend

+++
@title[Answer]
```sh
# Scale
docker service scale WORDPRESS_wordpress=3

# Inspect
docker service ps WORDPRESS_wordpress
```

@[1-2]
@[4-5]

