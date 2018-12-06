# Docker image

```render_ditaa
                  +-----------------+                                            +-----------------+
                  | cCCC            |                                            |  cCCC           |
                  |    CONTAINER    +-----MANAGES---+           +----MANAGES-----+      IMAGE      |
                  |                 |               |           |                |                 |
                  +-----------------+               |           |                +-----------------+
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                                    |           |
                                   +----------------+-----------+-----------------+
                                   | {o} cCCC           CLIENT                    |
                                   |                  docker CLI                  |
+-----------------+                |    +------------------------------------+    |                +-----------------+
|  cGRE           |                |    | {o} cCCC     REST API              |    |                |                 |
|     NETWORK     |                |    |                                    |    |                |      VOLUME     |
|                 |                |    |    +--------------------------+    |    |                |                 |
+--------+--------+                |    |    |{o} cCCC                  |    |    |                +--------+--------+
         |                         |    |    |          SERVER          |    |    |                         |
         |                         |    |    |                          |    |    |                         |
         +--------MANAGES----------+    |    |       docker daemon      |    |    +--------MANAGES----------+
                                   |    |    |                          |    |    |
                                   |    |    |                          |    |    |
                                   |    |    +--------------------------+    |    |
                                   |    +------------------------------------+    |
                                   +----------------------------------------------+

```

# Network drivers

- bridge
- host
- overlay
- macvlan
- none
- Network Plugin

# Bridge

- Default driver
- Software bridge 
- Isolation from host / other bridges

# Overlay

- Default driver for Docker Swarm
- On top of host-specific network
- Containers can only communicate across networks

# Network Plugins
 
- Only for Docker Swarm
- Adds encryption and discovery

# CLI reference - network

Parameter | Description
--------- | -------------
connect | Connect a container to a network
create    |  Create a network
disconnect | Disconnect a container from a network
inspect  |   Display detailed information on one or more networks
ls       |   List networks
rm       |   Remove one or more networks

# Example
1. Create new network
```{style="width: 40%;"}
docker network create mytestnet1
```
2. Start container in the network
```
docker run -d --name web1 --network mytestnet1 nginx
```

# Exercise

- Create two networks
- Run a nginx container with name 'web1'
- Start alpine container in same network and curl web1
  (Hint: `apk add curl; curl web1`)
- Start alpine container in the other network and curl web1

# Exercise (Answer) 1/2

```
# Create Networks
docker network create mytestnet1
docker network create mytestnet2
```

# Exercise (Answer) 2/2

```
# Start nginx
docker run -d --name web1 --network mytestnet1 nginx

# Test Isolation
docker run -it --rm --network mytestnet1 alpine \
    bin/sh -c 'apk add curl; curl web1'

docker run -it --rm --network mytestnet2 alpine \
    bin/sh -c 'apk add curl; curl web1'
```

