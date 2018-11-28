---?image=template/img/registry.jpeg

@title[Docker Registries]

@snap[north text-black span-100]
@fa[terminal fa-2x](Docker Registries)
@snapend

+++
@title[Overview]

@snap[north-west]
### Overview
@snapend

@snap[west span-100]
@ul[](false)
- Docker Hub
- Quay (CoreOS -> Red Hat -> IBM)
- ECR (AWS)
- ACR (Azure)
- gcr  (Google)
- local / On-Prem
@ulend
@snapend

+++
@title[Docker Hub]

@snap[north-west]
### Docker Hub
@snapend

@snap[north-east]
### [@fa[info]](https://hub.docker.com)
@snapend

@snap[west span-100]
@ul[](false)
- Default registry
- Free for public Repos
- Subscription for private Repos
@ulend
@snapend

+++
@title[Quay]

@snap[north-west]
### Quay
@snapend

@snap[north-east]
### [@fa[info]](https://quay.io)
@snapend

@snap[west span-100]
@ul[](false)
- Free for public Repos
- Subscrition for Private Repos
- pull with 
    ```docker pull quay.io/coreos/hyperkube```
@ulend
@snapend

+++
@title[Local]

@snap[north-west]
### Local Registries
@snapend

@snap[west span-100]
@ul[](false)
- registry
- Artifactory
- Nexus
@ulend
@snapend

+++
@title[registry]

@snap[north-west]
### registry from Docker Inc.
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/registry)
@snapend

@snap[west span-100]
@ul[](false)
- Started as container
- Runs only on amd64
- Free to use
@ulend
@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Start a local registry 
  (Hint: docker pull registry:2 - it runs on port 5000)
- Push and pull an image into it
@olend
@snapend

+++?code=template/md/registries/start-local-registry.sh?lang=sh
@title[Answer]
@snap[north-west]
### Exercise (Answer)
@snapend

@[1-2]
@[4-5]
@[7-8]
@[10-11]
@[13-14]
@[16-18]
