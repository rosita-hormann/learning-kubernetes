# General notes

**Digital Ocean Credit Referral Code:** : https://m.do.co/c/74dcb0137794

Kubernetes follows a thing called "**record of intent**"

# Kubectl

- https://kubernetes.io/docs/tasks/tools/
    - It has instructions for installation

## Kubeconfig file --> how to use?

let's say I have a `k8s.kubeconfig` file.

To run kubectl with that given kubeconfig file you must, for example:

```bash
kubectl --kubeconfig "k8s.kubeconfig" get nodes
```

Where to put your config file

```bash
mkdir ~/.kube
cp k8s.kubeconfig ~/.kube/config
cat ~/.kube/config
```

then you can go

```bash
kubectl get nodes
```

# Minikube

- Installation: https://kubernetes.io/docs/tasks/tools/install-minikube/

```bash
# vm-driver none means it'll user docker instead of a vm driver
minikube start --vm-dirver=none --extra-config=kubelet.cgroup-driver=systemd
```


# PODS

Represents a group of one or more application containers, and some shared resources for those contianers.

```bash
kubectl run mywebserver --image=nginx
kubectl exec -it mywebserver -- bash
kubectl delete pod mywebserver
```

# Kubernetes objects

A K8s object is a record of intent that you pass on to the Kubernetes cluster so the Kubernetes Master ensures that object exists among the kubernetes worker nodes.

Can be created through:

1. kubectl commands
2. Configuration file written in YAML

```bash
kubectl api-resources
kubectl explain pod
```

Documentation:

- https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/
- https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.27/#pod-v1-core
- https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#metadata

```bash
kubectl apply -f newpod.yaml 
kubectl delete -f newpod.yaml
```

# Command and Argument

```bash
kubectl run -d --name busybox busibox sleep 3600
```

With command: 

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: command
spec:
  containers:
  - name: count
    image: busybox
    command: ["sleep", "3600"] # it can also be args
```

with args:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: command
spec:
  containers:
  - name: count
    image: busybox
    command: ["sleep"]
    args: ["3600"]
```

# Exposing ports

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ngin-pod
spec:
  containers:
    - name: nginx
      image: nginx
      ports:
        - containerPort: 8080
```

```bash
kubectl explain pod.spec.containers.ports
```

# Generate manifests via CLI

```bash
# create a pod
kubectl run nginx --image=ngnix

# port
kubectl run nginx --image=ngnix --port=80

#output the Manifest File
kubectl run nginx --image=ngnix --port=80 --dry-run=client -o yaml

# delete all pods
kubectl delete pod --all
```

# Documentation using K8s CLI

```bash
kubectl explain {resource}

kubectl explain pods

kubectl explain pod.spec.containers
```

# PRACTICE TEST - DOMAIN 1

**Question 1**: Creating a Single Container Pods

a. Create a pod with the name of `kplabs-nginx`.

b. The pod should be launched from an image of  `mykplabs/kubernetes:nginx`

c. The name of the container should be `mycontainer`

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: kplabs-nginx
specs:
    containers:
        - image: mykplabs/kubernetes:nginx
          name: mycontainer
```

**Question 2**: Commands and Arguments

Create a pod with the name of `kplabs-cmdargs`. The pod should be launched from an image of `busybox`. The name of the container should be `cmdcontainer`. Both the container image's CMD and ENTRYPOINT instruction should be overridden.

The container should start with `sleep` command and argument of `3600`

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: kplabs-cmdargs
specs:
    containers:
        - name: cmdcontainer
          image: busybox
          command: ["sleep"]
          args: ["3600"]
```


**Question 3**: Exposing Ports for PODS

Create a pod with the name of `kplabs-ports`. The pod should be launched from an image of `nginx` The name of the container should be `nginx`. Expose Port 80 for the POD.

```yaml
apiVersion: v1
kind: Pod
metadata:
    name: nginx-ports
specs:
    containers:
        - name: nxinx-ports
          image: nginx
          ports:
            - containerPort: 80
```


**Question 4**: Arguments

Create a pod named `kplabs-logging`

The Pod should have a container running from the nginx image with the following arguments:

```bash
        - /bin/sh
        - -c
        - >
          i=0;
          while true;
          do
            echo "$i: $(date)" >> /var/log/1.log;
            echo "$(date) INFO $i" >> /var/log/2.log;
            i=$((i+1));
            sleep 1;
          done
```

Once POD is created, connect to the POD and verify the contents of `/var/log/1.log` and `/var/log/2.log`

```bash
kubectl exec -it kplabs-logging -- bash
tail /var/log/1.log
tail /var/log/2.log
```

# Notes

- https://docs.google.com/document/d/1RrhN_-WtApsFJNWt-mYI6W2RTY06uNKLM7es10Db7uM/edit#heading=h.6fxiynwr0aa5