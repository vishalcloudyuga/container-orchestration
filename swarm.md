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
$ curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
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
$ docker deploy rsvpstack
$ docker service ls
$ docker service ps rsvpstack_web
$ docker service update --publish-add 8080:5000 rsvpstack_web
$ docker service inspect rsvpstack_web
$ docker service scale rsvpstack_web=4
```

$ vagranr destory -f

