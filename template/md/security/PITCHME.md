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

@snap[west span-100]
Container security is Linux kernel security
@ul[](false)
- Kernel namespaces
- Control groups
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
- Do not run priviledged
- Run process as non-root user
@ulend
@snapend

+++
@title[Network Security]

@snap[north-west]
### Network Security
@snapend

@snap[west span-100]
@ul[](false)
- Seperate Docker networks
- In Swarm/K8s: Overlay networks
- WeaveNet: Encryption
@ulend
@snapend
