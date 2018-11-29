---?image=template/img/security.jpeg

@title[Docker Security]

@snap[north text-black span-100]
@fa[terminal fa-2x](Docker Security)
@snapend

+++
@title[Overview]

@snap[north-west]
### Container Security
@snapend
@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/security/security/#kernel-namespaces)
@snapend

@snap[west span-100]
Container security is Linux kernel security
@ul[](false)
- Kernel namespaces
- Control groups
- Add / Drop cpabilities
- Seccomp
- SELinux
- AppArmor
@ulend
@snapend

+++
@title[Image Security]

@snap[north-west]
### Image Security
@snapend

@snap[west span-100]
@ul[](false)
- Use trusted (or signed) Images
- Or build own
- Use image scanner (paid feature)
- Do not run privileged
- Run process as non-root user
@ulend
@snapend

+++
@title[Troubleshooting]

@snap[north-west]
### Limit Ressources
@snapend

Parameter | Description
------------ | -------------
cpus | Limit CPUs usage (0.1 - 1)
cpuset-cpus	 | Limit the specific CPUs or cores a container can use
memory | The maximum amount of memory 
memory-reservation	 | Soft Limit

@snapend

+++

@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ol[](false)
- Start Alpine and limit ressources to use only 1 CPU with 50%
- Stress the CPU with
```dd if=/dev/zero of=/dev/null```
- See top and docker stats
@olend
@snapend

+++
@title[Answer]
@snap[north-west]
### Exercise (Answer)
@snapend

```sh
# Start Container
docker run -it --cpus 0.5 --cpuset-cpus 1 alpine

# Check
top
docker stats

```

@[1-3]
@[4-6]
+++
@title[Answer]
@snap[north-west]
### Exercise (Answer)
@snapend

![layer](template/img/memory.png)

+++
@title[Network Security]

@snap[north-west]
### Network Security
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/network/overlay/#encrypt-traffic-on-an-overlay-network)
@snapend

@snap[west span-100]
@ul[](false)
- Seperate Docker networks
- In Swarm/K8s: Overlay networks
- WeaveNet/Overlay: Encryption
@ulend
@snapend

+++
@title[Network Security]

@snap[north-west]
### Network Security
@snapend

```
docker network create \
    --opt encrypted \
    --driver overlay \
    --attachable my-attachable-multi-host-network
```
