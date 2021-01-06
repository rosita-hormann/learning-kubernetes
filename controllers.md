# Controllers

Benefits of using controllers:
- Application relability
- Scaling
- Load balancing

## Types of controllers:

- ReplicaSets
- Deployments
- DaemonSets
- Jobs
- Services

### ReplicaSets

Ensures that a specified number of replicas for a pod are running at all times.

### Deployments

Provides declarative updates for pods and ReplicaSets.

You can describe the desired state of a deployment in a YAML file.

### DaemonSets

Ensure that all nodes run a copy of a specific pod.

### Jobs

Supervisor process for pods carrying out batch jobs.

Run individua; processes that need to run once and complete successfully.

Typically Jobs are run as cron jobs.


### Services

Allow the communication between one set of deployents with another.

Use a service to get pods in two deployments to talk to each other.

