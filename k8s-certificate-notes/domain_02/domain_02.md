# Domain 2 - POD Design

## Labels and Selectors

Labels: Key/value pair that are attached to objects

Selectors: Allows us to filter objects based on labels

```bash
kubectl get pods -l env=dev
kubectl get pods -l env=!dev #not
kubectl get pods --show-labels


kubectl label pod my-pod env=dev #assign label
kubectl label pod my-pod env- #desassign label

kubectl label pods --all status=running #assign label to all pods

kubectl delete pods --all
```

```yaml
apiVersion: v1
kind: Pod
metadata:
    creationTimestamp: null
    labels:
        run: nginx
        env: dev
    bame: my-nginx

spec:
    containers:
    - image: nginx
      name: nginx
      resources: {}
```

## ReplicaSets

Its purpose is to maintain a stable set of replica Pods running at any given time

- desired state = 3
- image = nginx
- current state = 3

```bash
kubectl get replicaset
```

```yaml
# replicaset.yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
    name: frontend
    labels: # Not required
        app: guestbook
        tier: frontend
spec:
    replicas: 3
    selector:
        matchLabels:
            tier: frontend
        template: # Equals to what you would put on a Pod declaration
            metadata:
                labels:
                    tier: frontend
            spec:
                containers:
                - name: php-redis
                  image: gcr.io/google_samples/gb-frontemd:v3

```

```bash
kubectl apply -f replicaset.yml
kubectl get replicaset
kubectl get rs
kubectl delete -f replicaset.yaml 
```

## Deployments

Provides replication functionality with the help of ReplicaSets, along with various additional capability like rolling out of changes, rollback changes if required, etc.

```bash
kubectl get deployments

```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
    tier: frontend
    #   app: nginx
  template:
    metadata:
      labels:
        app: nginx
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80

```

```bash
kubectl apply -f deployment.yml
kubectl get deployments
kubectl get replicaset
kubectl get pods

# Rollout changes:
# Example: Update Pod's image
kubectl apply -f deployment.yml
# It creates a new replicaset and then removes de old one
kubectl describe deployments nginx-deployment
kubectl rollout history deployment.v1.apps/nginx-deployment
kubectl rollout history deployment.v1.apps/nginx-deployment
kubectl rollout undo deployment.v1.apps/nginx-deployment --to-revision 1
kubectl get rs
kubectl describe dployment nginx-deployment



### Create deployment via cli
kubectl create deployment my-dep --image=nginx --replicas 3 # --replicas optional
kubectl get deployment
kubectl get pods
kubectl delete deployment my-dep ## removes pods too
```

**maxSurge**: Maximum Number of PODS that can be scxheduled above original number of pods
**maxUnavailable**: Maximum number of pods that can be unavailable during the update