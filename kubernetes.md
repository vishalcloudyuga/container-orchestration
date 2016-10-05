## Architecture 
![k8s](images/kube_arch.png)

### Components

### Defining an application 

#### Deployments

#### MongoDB
```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: rsvp-db
spec:
  replicas: 1
  template:
    metadata:
      labels:
        appdb: rsvpdb
    spec:
      containers:
      - name: rsvpd-db
        image: mongo:3.3
        env:
        - name: MONGODB_DATABASE
          value: rsvpdata
        ports:
        - containerPort: 27017
```
#### RSVP App
```
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: rsvp
spec:
  replicas: 2
  template:
    metadata:
      labels:
        app: rsvp
    spec:
      containers:
      - name: rsvp-app
        image: teamcloudyuga/rsvpapp
        env:
        - name: MONGODB_HOST
          value: mongodb
        ports:
        - containerPort: 5000
```

#### Services

#### MongoDB
```
apiVersion: v1
kind: Service
metadata:
  name: mongodb
  labels:
    app: rsvpdb
spec:
  ports:
  - port: 27017
    protocol: TCP
  selector:
    appdb: rsvpdb
```


#### RSVP App
```
apiVersion: v1
kind: Service
metadata:
  name: rsvp
  labels:
    app: rsvp
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 5000
    protocol: TCP
  selector:
    app: rsvp
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

### Download *kubectl*

```
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.3.5/bin/linux/amd64/kubectl
```

### Configure *kubectl*
- Copy the share config file inside ~/.kube 
```
$ cp <PATH>/config ~/.kube
```

### Create the namespace 
```
$ kubectl create namespace <username>
```

### Get the current context
```
$ export CONTEXT=`kubectl config view | awk '/current-context/ {print $2}'`
```

### Update the default namespace for the current context 
```
$ kubectl config set-context $CONTEXT --namespace=<username>
```

### Create db
```
$ kubectl create -f rsvp-db.yaml
$ kubectl create -f rsvp-db-service.yaml
```

### Create Web
```
$ kubectl create -f rsvp-web.yaml
$ kubectl create -f rsvp-web-service.yaml
```

### List 
```
$ kubectl get deployments
$ kubectl get svc
``` 

### Scale 
```
$ kubectl scale --replicas=4 deployments/rsvp
```

### Delete
```
$ kubectl delete deployments/rsvp deployments/rsvp-db
$ kubectl delete svc/mongodb svc/rsvp
```

