---?image=template/img/network.jpeg

@title[Docker network]

@snap[north]
## Docker network
@snapend

+++
@title[Network drivers]

@snap[north-west]
### Network drivers
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/network)
@snapend

@snap[west span-100]
@ul[](false)
- bridge
- host
- overlay
- macvlan
- none
- Network Plugin
@ulend
@snapend


+++
@title[bridge]

@snap[north-west]
### Bridge
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/network/bridge)
@snapend

@snap[west span-100]
@ul[](false)
- Default driver
- Software bridge 
- Isolation from host / other bridges
@ulend
@snapend

+++

@title[Overlay]

@snap[north-west]
### Overlay
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/network/overlay)
@snapend

@snap[west span-100]
@ul[](false)
- Default driver for Docker Swarm
- On top of host-specific network
- Containers can only communicate across networks
@ulend
@snapend

+++

@title[Network Plugins]

@snap[north-west]
### Network Plugins
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/engine/extend/plugins_services/#volume-plugins)
@snapend

@snap[west span-100]
@ul[](false)
- Only for Docker Swarm
- Adds encryption and discovery
@ulend
@snapend

+++
@title[Exercise]

@snap[north-west]
### Exercise
@snapend

@snap[west span-100]
@ul[](false)
- Create two networks
- Run a nginx container with name 'web1'
- Start alpine container in same network, install alpine and curl web1
- Start same container again the other network
@ulend
@snapend

+++?code=template/md/network/example.sh?lang=sh&title=Solution
@title[Solution]

@[1-3]
@[5-6]
@[8-13]
@[15-19]
