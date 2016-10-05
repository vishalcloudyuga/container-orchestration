# Container Orchestration

## Objectives
- Learn what is container orchestration. 
- Learn about why we need container orchestration.
- Learn about what is needed to build container orchestrator. 
- Learn about different container orchestrators.
- Learn how to deploy the an application to different container orchestrators.

## Prerequisite

### Option - 1 
- Createi minimum two Linux VMs (local or cloud) with Docker 1.12 installed 
 - To install Docker, run following command 
```
$  curl -fsSL https://experimental.docker.com/ | sh 
```
- Install [Docker Compose](https://docs.docker.com/compose/) on one of the VM  

```
$ curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-\`uname -s\`-\`uname -m\` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
```
- Install and configure [Minikube](https://github.com/kubernetes/minikube)
- Install [kubectl](http://kubernetes.io/docs/user-guide/kubectl-overview/) on one of VM
```
$ curl -O https://storage.googleapis.com/kubernetes-release/release/v1.3.6/bin/linux/amd64/kubectl
$ chmod +x kubectl
$ mv kubectl /usr/local/bin/kubectl
```  

### Option - 2
- Install [Vagrant](https://www.vagrantup.com/)     
- Install Vagrant DigitalOcean Plugin
```
$ vagrant plugin install vagrant-digitalocean
```
- [Create an account on DigitalOcean](http://www.digitalocean.com/?refcode=6883b56f3ade) 
 - Login to New account
 - [Generate an API token](https://cloud.digitalocean.com/settings/api/tokens)
 - export the token with **DO_TOKEN** environent variable 
 ```
 $ export DO_TOKEN="1234........"
 ```
- Install [Docker Compose](https://docs.docker.com/compose/) on one of the VM  
```
$ curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
```
- Install kubectl(http://kubernetes.io/docs/user-guide/kubectl-overview/) on one of VM
```
$ curl -O https://storage.googleapis.com/kubernetes-release/release/v1.3.6/bin/linux/amd64/kubectl
$ chmod +x kubectl
$ mv kubectl /usr/local/bin/kubectl
```  
