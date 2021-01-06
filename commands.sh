# kubectl commands

kubectl get nodes
kubectl get all

kubectl get deployment
kubectl get deployment/helloworld
kubectl get deployment/helloworld -o yaml

kubectl create -f file.yaml

kubectl expose deployment helloworld --type=NodePort


## scale out

# To have four pods running for a single deployment, what command will you run? answer:
kubectl scale --replicas=4 deploy/helloworld-deployment

# help with minikube:
minikube service helloworld