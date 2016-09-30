## Architecture 

### Components

#### Defining an application 

#### High availablity of application 

#### Service discovery of applications 

#### Load Balancing an application

#### Autoscaling an application 

#### Rolling upgrade and rollback of an application 

#### Internally connecting to other application 

#### Networking option to connect applications with-in the cluster  

#### Accessing the application from external world 

#### Managing storage for application

##### Volume Plugins

## Demo 

```
$ cd docker-swarm
$ vagrant up --provider=digital_ocean
$ vagrant ssh manager
$ git clone https://github.com/cloudyuga/rsvpapp.git
```

On Manager 
```
root@manager:~/rsvpapp# docker swarm init --advertise-addr=139.59.27.233
Swarm initialized: current node (bsizx5e0vd14u3lj3yolukhwe) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join \
    --token SWMTKN-1-0i5hzr6rehtpnrn7z64k589ugkh9by4itoue5qs0fglnupsit9-ev03cbqquv0injxmpyph3zp67 \
    139.59.27.233:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

On Worker1
```
root@worker1:~# docker swarm join \
>     --token SWMTKN-1-0i5hzr6rehtpnrn7z64k589ugkh9by4itoue5qs0fglnupsit9-ev03cbqquv0injxmpyph3zp67 \
>     139.59.27.233:2377
This node joined a swarm as a worker.
```

On Worker2
```
root@worker2:~# docker swarm join \
>     --token SWMTKN-1-0i5hzr6rehtpnrn7z64k589ugkh9by4itoue5qs0fglnupsit9-ev03cbqquv0injxmpyph3zp67 \
>     139.59.27.233:2377
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

Deploy the RSVP service with
```
$ docker deploy rsvpapp
$ docker service ls
$ docker service inspect rsvpapp_web
$ docker service scale rsvpapp_web=4
```

$ vagranr destory -f

