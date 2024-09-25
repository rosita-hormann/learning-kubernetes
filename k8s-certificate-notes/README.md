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