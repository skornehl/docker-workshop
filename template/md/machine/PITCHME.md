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
- With drivers for local VMs and cloud providers
- Creates VM, installs Docker Engine and enables TCP socket with TLS
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
- SSH
- OpenStack, vSphere
- AWS, Azure, GCE
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
@title[Example - AWS EC2]

@snap[north-west]
### Example - AWS EC2
@snapend

@snap[north-east]
### [@fa[info]](https://docs.docker.com/machine/examples/aws/) 
@snapend

```sh
docker-machine create \
  --driver amazonec2 \
  --amazonec2-open-port 8000 \
  --amazonec2-region us-west-1 \
  aws-sandbox
```
