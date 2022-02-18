# -- KUBECTL --

# -- kubectl get --
kubectl get nodes
kubectl get all

kubectl get deployment
kubectl get deployment/helloworld
kubectl get deployment/helloworld -o yaml

kubectl get pods --show-labels


# -- kubectl create --
kubectl create -f file.yaml


# others
kubectl expose deployment helloworld --type=NodePort
kubectl cordon <node-name> # To prevent a node from scheduling new pods, Which will cause the node to be in the status: Ready,SchedulingDisabled.
kubectl uncordon <node-name> # To tell is to resume scheduling


# -- Labels --
## (every example is with pods, but it can be done with pods, deployments, replica-sets, etc.)
kubectl get pods --show-labels
kubectl label po/helloworld app=helloworldapp # set new label=value
kubectl label po/helloworld app=helloworldapp --overwrite # to set (replace previous label)
kubectl label po/helloworld app- # to delete

## -- selectors --
## used to search with labels
kubectl get pods --selector env=production # here env is the label and production is the label value.
kubectl get pods --selector dev-lead=karthik,env=staging
kubectl get pods --selector dev-lead!=karthik,env=staging # != menas "not in"
kubectl get pods -l 'release-version in (1.0,2.0)' # in selector. --selector == -l
kubectl get pods -l 'release-version notin (1.0,2.0)' # notin selector
kubectl delete pods -l dev-lead=karthik # deleting with selectors

# -- Scale Out --
## To have four pods running for a single deployment, what command will you run? answer:
kubectl scale --replicas=4 deploy/helloworld-deployment


# (!) danger zone (!)
kubectl delete all --all