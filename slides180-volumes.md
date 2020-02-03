# Docker Volumes {bg=#1111;assets/img/volume.jpeg}

# Docker volumes

##
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
|  cCCC           |                |    | {o} cCCC     REST API              |    |                | cGRE            |
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

## Overview

```render_ditaa
                                 +-------------------------------+
                                 |                               |
                                 |           CONTAINER           |
                   +-------------+                               +----------+
                   |             +----+---+----------------------+          |
                   |                  |   |                                 |
                   |                  |   |                                 |
                   |                  |   |                                 |
                   v                  |   |                                 v
+--------------------------------+    |   |                   +-----------------------+
|             DEVICE             |    |   |                   |                       |
|  +--------------------------+  |    |   |                   |         TMPFS         |
|  |          VOLUME          |  |    |   |                   |                       |
|  |   +-------------------+  |<------+   |                   +-----------------------+
|  |   |                   |  |  |        |                   
|  |   |      DOCKER       |  |  |        |
|  |   |       AREA        +<-------------+
|  |   |                   |  |  |
|  |   +-------------------+  |  |
|  +--------------------------+  |
+--------------------------------+
```

## CLI reference - volume

Parameter | Description
------------ | -------------
create | Create a volume
inspect | Display detailed information
ls | List volumes
prune | Remove all unused local volumes
rm | Remove volume

## CLI reference - volume create

Parameter | Description
------------ | -------------
-d | Driver (default: local)
--label | Metadata
--name | Volume name
-o | Options

## Mount vs -v 1/2

- To bind mounts, all options for volumes are available for both --mount and -v flags.
- When using volumes with services (Swarm), only --mount is supported.

## Mount vs -v 2/2

```
# --mount
docker run -d \
  --name devtest \
  --mount source=myvol2,target=/app \
  nginx:latest

# -v
docker run -d \
  --name devtest \
  -v myvol2:/app \
  nginx:latest
```

## Example tmpfs 

```
# Create tmpfs
docker volume create --driver local \
    --opt type=tmpfs \
    --opt device=tmpfs \
    --opt o=size=100m,uid=1000 \
    foo

# Mount into container
docker run -it --rm -v foo:/foo busybox df -h
```

## Example btrfs 

```
# Create btrfs
docker volume create --driver local \
    --opt type=btrfs \
    --opt device=/dev/sda2 \
    foo
```
## Example nfs 

```
# Create nfs
docker volume create --driver local \
    --opt type=nfs \
    --opt o=addr=192.168.1.1,rw \
    --opt device=:/path/to/dir \
```

## Run devices inside a container 

```
# Run device
docker run --rm -it \
    --device=/dev/sda:/dev/xvdc:r \
    debian \
    fdisk /dev/xvdc
```

## USB Mount

![](assets/img/usb.png)

## Exercise

1. Create a new local `index.html` file
2. Use a volume to mount this file into the nginx container
3. Test that the local file is displayed
4. Change the local file content and revisit the page
