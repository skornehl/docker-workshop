---?image=template/img/run.jpeg
@title[Docker Machine]

@snap[north text-white span-100]
@fa[terminal fa-2x](Docker Machine)
@snapend

+++

@title[Overview]

@snap[north-west]
### Overview 
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/machine/overview/) 
@snapend

@snap[west span-100]
@ul[](false)
- CLI tool for provisioning Docker hosts
- With drivers for local VM, data center and cloud providers
- Creates VM
- Installs Docker Engine and enables TCP socket
- Generates TLS certs
@ulend
@snapend

+++

@title[Drivers]

@snap[north-west]
### Drivers
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/machine/drivers/) 
@snapend

@snap[west span-100]
@ul[](false)
- VirtualBox (_Linux, OS X_)
- VMware Fusion (_OS X_)
- Hyper-V (_Windows_)
- OpenStack, vSphere
- AWS, Azure, GCE
- Generic (SSH)
@ulend
@snapend


+++
@title[CLI reference - docker-machine]

@snap[north-west]
### CLI reference
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/machine/reference/)
@box[bg-gray rounded](docker-machine [COMMAND])
@snapend
<br/>
<br/>

Parameter | Description
--------- | -------------
create | Create a machine
ls | List machines
stop | Gracefully stop a machine
rm | Remove a machine

+++
@title[Example - Generic (SSH)]

@snap[north-west]
### Example - Generic (SSH)
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/machine/drivers/generic/) 
@snapend

```sh
docker-machine create \
  --driver generic \
  --generic-ip-address=172.16.62.130 \
  --generic-ssh-key ~/.ssh/id_rsa \
  --generic-ssh-user root \
  default
```
+++
@title[Environment Commands]

@snap[north-west]
### Environment Commands
@snapend
```
docker-machine env default
```

```
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://172.16.62.130:2376"
export DOCKER_CERT_PATH="/Users/<yourusername>/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell:
# eval "$(docker-machine env default)"
```
