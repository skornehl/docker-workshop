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
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Go to www.play-with-docker.com
- Add 3 nodes
- Run ```docker swarm init``` on first node
- Run ```docker swarm join --token <TOKEN> <IP>``` on all other 
- Have a look woth ```docker node ls```
@olend
@snapend

+++?code=template/md/network/example.sh?lang=sh&title=Answer
@title[Answer]

@[1-3]
@[5-6]
@[8-13]
@[15-19]
