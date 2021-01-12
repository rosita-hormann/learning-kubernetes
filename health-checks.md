# Health checks

**Probs**: Write them down inside a container information, on the yaml file for Kubernetes deployment of pods.

Examples of probs:
- readinessProbe
- livenessProbe


### bad readinessProbe

```bash
kubectl describe po/<pod-name>
```

look for "events".

it's running but not ready. In events, has a warning with the error to connection.

### bad livenessProbe

Pods is running, ready, it restarted 3 times and then goes to a *CrashLoopBackOff* status.

If we use describe on the pod, liveness probe failed.

Deployment is also in not ready status.