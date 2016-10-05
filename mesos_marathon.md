## Architecture 

### Components

### Defining an application 

#### Database
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

#### RSVP
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
```  

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

### Clone
```
$ git clone https://github.com/cloudyuga/container-orchestration.git
```

#### Deploy
```
$ cd container-orchestration/mesos-marathon
$ sh delpoy.sh
```

