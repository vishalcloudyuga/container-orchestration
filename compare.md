# Comparison

## Notes
- Work is happening very rapidly in this space. Tools are borrowing concepts from one another to make them easy for their users.
- You would need to understand your requirement and then choose the best fit.
- BORG and Omega are the geneis for most of the container orchestrator tools.


## Docker Swarm Mode

### Advantage
- Easy to use
- Docker Inc's Official solution
 - part of docker binary 
- Secure by default 

### Features which are coming 
- Distributed Application Bundle
- Secrets 
- Logging  
- Scheduler updates
- Rollback feature
- Cluster Federation
- Autoscale

### Not so Pro 
- No concepts of Pods

## Kubernetes
- Most popular container orchestrator as as now. 
- Rich and advance constructs  
- Multitenacy
- Federation
- updates and maintenance

### Features which are coming 
- kubelet TLS bootstrap
- tool to bootstrap kubernetes (kubeadm)
- Service LB
- and [many more](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG.md) 

### Not so Pro 
- Setup is hard as compared to Docker Swarm. Work is progress to make easier.  

## Mesos (Marathon)
- Most mature and predates Docker
- Scales to thousands of nodes
- It can run mix workload containers, Hadoop, spark etc 
- Nice GUI
- Used by large companies 
  - Twitter, AirBnb

### Not so Pro 
A bit difficult to setup 
