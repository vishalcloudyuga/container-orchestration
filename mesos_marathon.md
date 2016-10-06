## Architecture 

[Mesos Arch](http://mesos.apache.org/assets/img/documentation/architecture3.jpg)

### Components
- Mesos Master
- Mesos Agent Nodes
- Zookeeper 
- Frameworks
 - Marathon
 - Chronos
 - ...

### Defining an application 
- Individual app
- Application Group

#### RSVP App
##### Database
```
{
  "id": "mongodb",
  "cmd": null,
  "cpus": 1,
  "mem": 128,
  "disk": 0,
  "instances": 1,
  "container": {
    "docker": {
      "image": "mongo:3.3",
      "network": "BRIDGE",
      "portMappings": [
        {
          "containerPort": 27017,
          "protocol": "tcp",
          "servicePort": 27017,
          "name": "mongo"
        }
      ],
      "parameters": []
    },
    "type": "DOCKER",
    "volumes": []
  },
  "env": {
    "MONGODB_DATABASE": "rsvpdata"
  },
  "labels": {},
  "healthChecks": []
}
```

##### RSVP
```
{
  "id": "rsvp",
  "cmd": null,
  "cpus": 1,
  "mem": 128,
  "disk": 0,
  "instances": 1,
  "container": {
    "docker": {
      "image": "teamcloudyuga/rsvpapp",
      "network": "BRIDGE",
      "portMappings": [
        {
          "containerPort": 5000,
          "protocol": "tcp",
          "name": "rsvp"
        }
      ]
    },
    "type": "DOCKER"
  },
  "env": {
    "MONGODB_HOST": "mongodb.marathon.mesos"
  }
}
```

#### High availablity of application 
- Application scales on multiple slave nodes 

#### Service discovery and Load Balancing an application
- [Mesos-DNS](https://github.com/mesosphere/mesos-dns) - provides service discovery through the domain name system (DNS).
- [Marathon-lb](https://github.com/mesosphere/marathon-lb) - provides port-based service discovery using HAProxy.    

#### Autoscaling an application 
- Requests Per Second (RPS) based [marathon based autoscale](https://github.com/mesosphere/marathon-lb-autoscale)
- [CPU and Memory based auto-scaling](https://docs.mesosphere.com/1.7/usage/tutorials/autoscaling/cpu-memory/) 

#### Rolling upgrade and rollback of an application 

#### Internally connecting to other application 

#### Networking option to connect applications with-in the cluster  


#### Accessing the application from external world 

#### Managing storage for application
- Persistent Local volume
- External Persistent volumes
 - Amazon EBS
 - [Experimental Flocker Plugin](https://docs.clusterhq.com/en/latest/mesos-integration/index.html) 


## Demo 

### Clone
```
$ git clone https://github.com/cloudyuga/container-orchestration.git
```

#### Deploy
```
$ cd container-orchestration/mesos-marathon
$ sh delpoy.sh
```

