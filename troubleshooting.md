# Troubleshooting

## Basics

```bash
kubetcl get pods

#(hay uno que tiene 0/1)

kubectl describe deployment {deployment name with problems}


# From pod perspective:
kubectl describe po/{pod name with problems}

# look at events for debugging
# look at Type warnings and Reasons Failed.


# Other technicke

kubectl get deployments

kubectl get pods

kubectl logs {pod name}

# 3ds Other option

kubectl exec -it {pod name} /bin/bash

# this enters the pod shell, you can check processes and files.

kubectl exec -it {pod name} -c {specyfic container} /bin/bash

```