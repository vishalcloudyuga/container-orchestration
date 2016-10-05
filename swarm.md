## Architecture 

### Components

![Swarm Arch](images/swarm_arch.png)

- Manager
- Nodes

#### Defining an application 
- Services
  - tasks
    - containers

### Scheduler
- Resource Availability
- Labels and constraints 
 - Labels
   - env=test, storage=ssh
 - Constraints 
   - Nodes
- Engine Label 
  - Attached to Docker Engine
  - Change/modify requires Docker engine restart
  - Update the /etc/.. docker or docker command line   
  -  docker service create --constraint engine.labels.storage==ssh

- Node Labels and C
  - Does not require docker daemon restart
  - docker node update --label-add security=high
  - docker node update -label-rm security
  - docker service create --con  node.labels. 

Strategy and affinity
  - In Swarm mode only strategy supported is spread

#### High availablity of application 
- Replicas of contaimers running on multiple nodes. 

#### Service discovery and Load Balancing an application
- iptables 
  - classifies, modify and take decisions based on the packet
- IPVS
  - load balancer at transport layer available in the Linux kernel

#### Autoscaling an application 

#### Rolling upgrade and rollback of an application 

#### Internally connecting to other application 

#### Networking option to connect applications with-in the cluster  
- Overlay network

#### Accessing the application from external world 
- 

#### Managing storage for application

##### Volume Plugins

## Demo 

```
$ cd docker-swarm
$ vagrant up --provider=digital_ocean
$ vagrant ssh manager
$ git clone https://github.com/cloudyuga/rsvpapp.git
$ cd rsvpapp
```

On Manager 
```
root@manager:~/rsvpapp# docker swarm init --advertise-addr=<MANAGER_IP>
Swarm initialized: current node (<MANAGER_NODE_ID>) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-<TOKEN> \
    <MANAGER_IP>:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

On Worker1
```
root@worker1:~# docker swarm join \
>     --token SWMTKN-1-<TOKEN> \
>     <MANAGER_IP>:2377
This node joined a swarm as a worker.
```

On Worker2
```
root@worker2:~# docker swarm join \
>     --token SWMTKN-1-<TOKEN> \
>     <MANAGER_IP>:2377
This node joined a swarm as a worker.
```


On Manager
```
$ docker info
$ docker service create alpine ping 8.8.8.8
$ docker service ps <serviceID>
$ docker sevice inspect  <serviceID>
$ docker service update <serviceID> --replicas 4
$ docker service create --name web --publish 80:80 --replicas 4 nginx
```

Deploy the RSVP service manually
```
$ docker network create --driver overlay rsvpnet
$ docker service create --name mongodb  -e MONGODB_DATABASE=rsvpdata --network rsvpnet  mongo:3.3
$ docker service create --name rsvp  -e MONGODB_HOST=mongodb --publish 5000  --network rsvpnet teamcloudyuga/rsvpapp
$ docker service ps
$ docker service inspect rsvp
$ docker service scale rsvp=5
$ docker service rm rsvp
$ docker service rm mongodb
```

Deploy the RSVP service with Docker Application Bundle
```
$ docker deploy rsvpapp
$ docker service ls
$ docker service inspect rsvpapp_web
$ docker service scale rsvpapp_web=4
```


Other Examples 
```
$ docker service update --image teamcloudyuga/rsvpapp:1 --update-delay 10s rsvp
$ docker service create --name util --network rsvp --mode global alpine sleep 200
$ docker service update stateful --constraint-add node.hostname==$HOSTNAME
$ docker service update stateful --limit-memory 100M
$ docker service update statful --mount-add type=volume,source=somename,target=/data
```

Managing Nodes 
```
$ docker node update <node_name> --availability <active/pause/drain>
$ docker swarm promote
$ docker swarm demote
$ docker swarm leave
```

$ vagranr destory -f

