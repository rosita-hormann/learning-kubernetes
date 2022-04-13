Remove all Evicted pods:

```bash
kubectl get pod | grep Evicted | awk '{print $1}' | xargs kubectl delete pod
```
