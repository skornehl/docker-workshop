# What's next? {bg=#000;assets/img/orchestration.jpeg}

# Orchestration!

## Overview - Technologies
- Swarm
- Kubernetes (K8S)
- Apache Mesos
- Nomad

## Overview - Cloud
- EKS
- ECS
- AKS
- GKE

# Docker Swarm

##
- Cluster management integrated with Docker Engine
- Decentralized design
- Scaling
- Multi-host networking
- Service discovery
- Load balancing

## CLI reference

Parameter | Description
--------- | -------------
  init | Initialize a swarm
  join | Join a swarm
  leave | Leave the swarm
  update | Update the swarm

## Example

- Spin up nodes until you have 3
- Initialize master
- Join the other as nodes
- Have a look with `docker node ls`

###Example (Answer)

```sh
# Deploy compose file
docker swarm init --advertise-addr=[IP]

# Join Nodes
docker swarm join --token [TOKEN] [IP]:2377

# List Service
docker node ls
```
## CLI reference - service

Parameter | Description
--------- | -------------
create | Create a new service
deploy | Deploys a Service
inspect | Display detailed information on one or more services
logs | Fetch the logs of a service or task
ls | List services

## CLI reference - service

Parameter | Description
--------- | -------------
ps | List the tasks of one or more services
rollback | Revert changes to a service's configuration
scale | Scale one or multiple replicated services
update | Update a service

## Exercise

- Upload your docker-compose file with wordpress
- Deploy it into your Swarm cluster
- Find out where your containers are
- Scale wordpress to 3

## Exercise (Answer)

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

## Exercise

- Scale wordpress to 5
- Monitor what happens
- Look where the containers are
- Remove a node
- Monitor what happens

## Exercise (Answer)

```sh
# Scale
docker service scale WORDPRESS_wordpress=5

# Inspect
docker service ps WORDPRESS_wordpress
```
# Kubernetes

##
- Cluster management 
- Storage orchestration
- Scaling
- Multi-host networking
- Service discovery
- Load balancing

## Kubernetes - POD

- Smallest unit in K8s
- Can be single or multi container
- Share network and storage

## CLI reference - kubeadm

Parameter | Description
--------- | -------------
  init | Initialize k8s master
  join | Join a k8s node
  reset | Leave the cluster
  upgrade | Update the cluster

## Example
- Destroy your current nodes
- Add 3 new nodes
- Initialize master
- Initialize network
- Join the other as nodes
- Have a look with `kubectl get nodes`

## Example (Answer)

```sh
# Deploy compose file
kubeadm init --apiserver-advertise-address $(hostname -i)

# Initialize network
kubectl apply -n kube-system -f \
    "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 |tr -d '\n')"

# Join Nodes
kubeadm join [IP]:6443 --token [TOKEN] --discovery-token-ca-cert-hash [HASH]

# List Service
kubectl get nodes
```
## CLI reference - kubectl

Parameter | Description
--------- | -------------
get | List one or more resources
describe | Display the detailed state
logs | Print the logs for a container in a pod
exec | Execute a command 

## CLI reference - kubectl

Parameter | Description
--------- | -------------
create | Create one or more resources 
delete | Delete resources
run | Run a specified image 
patch | Update one or more fields

## Example

- Run wordpress container

## Example (Answer)

```sh
# Deploy wordpress
kubectl run wordpress --image=wordpress:latest --port=8000
```
## Generate YAML

```sh
kubectl get deployment wordpress -o yaml | less
```
## Generate YAML

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: SOME_DATE
  generation: 1
  labels:
    run: wordpress
  name: wordpress
  namespace: default
  resourceVersion: "5333"
  selfLink: /apis/extensions/v1beta1/namespaces/default/deployments/wordpress
  uid: 311691d6-f2ec-11e8-8c8b-024208017631
spec:
  progressDeadlineSeconds: 600
  replicas: 1
  revisionHistoryLimit: 2
  selector:
    matchLabels:
      run: wordpress
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        run: wordpress
    spec:
      containers:
      - image: wordpress:latest
        imagePullPolicy: Always
        name: wordpress
        ports:
        - containerPort: 8000
          protocol: TCP
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  conditions:
  - lastTransitionTime: SOME_DATE
    lastUpdateTime: SOME_DATE
    message: Deployment does not have minimum availability.
    reason: MinimumReplicasUnavailable
    status: "False"
    type: Available
  - lastTransitionTime: SOME_DATE
    lastUpdateTime: SOME_DATE
    message: ReplicaSet "wordpress-565d787b8f" is progressing.
    reason: ReplicaSetUpdated
    status: "True"
    type: Progressing
  observedGeneration: 1
  replicas: 1
  unavailableReplicas: 1
  updatedReplicas: 1
  ```
  