# Applcations upgrades.

```bash
kubectl create -f helloworld-black.yaml --record

# now update to blue:
kubectl set image deployment/navbar-deployment helloworld=karthequian/helloworld:blue

kubectl get deployment
```

what happens here is that deployment is updated, a new rs (replicaset) is created (the previous one is not deleted automatically)

```bash
kubectl rollout history deployment/navbar-deployment
```

### Rollback

```bash
kubectl rollout undodeployment/navbar-deployment

kubectl rollout undodeployment/navbar-deployment --to-revision=1 # check number revision
```