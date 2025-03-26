## Setup Overview

### 1. Build and Push Docker Image

##### A. Local Deployment on Minikube
```bash
docker build -t todo-k8 .
docker tag todo-kube <dockerhub-username>/todo-k8:latest
docker push <dockerhub-username>/todo-k8:latest
```

##### B. Deployment on AWS EKS
```bash
docker build --platform linux/amd64,linux/arm64 -t todo-k8 .
docker tag todo-k8 <dockerhub-username>/todo-k8:latest
docker push <dockerhub-username>/todo-k8:latest
```

### 2. Local Deployment on Minikube


##### (1) Start Minikube, apply manifests
```bash
minikube start
kubectl apply -f kube/minikube/namespaces.yaml
kubectl apply -f kube/minikube
```

##### (2) Visit local Minicube deployment
```bash
minikube service <service_name>
```
##### (3) Delete Minikube
```bash
minikube stop
minikube delete
```

### 3. Production Deployment using AWS EKS

##### (1) Deployment on AWS EKS
```bash
aws eks update-kubeconfig --region <aws-region> --name <eks-cluster-name>
kubectl apply -f kube/AWS_EKS/namespace.yaml
kubectl apply -f kube/AWS_EKS/
```



#### A. Monitoring & Alerts
##### (1) Installing prometheus stack
```bash
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
```
##### (2) Upgrading prometheus stack
```bash
helm upgrade prometheus prometheus-community/kube-prometheus-stack --namespace monitoring -f helm/alertmanager-values.yaml
```




### 777. Supplemental

```bash
# Useful kubectl functions

# View specifically by namespace
kubectl get deployments -n <namespace>
kubectl get services -n <namespace>
kubectl get pods -n <namespace>

# View all
kubectl get deployments --all-namespaces
kubectl get services --all-namespaces
kubectl get pods --all-namespaces

# Granular view
kubectl get deployments -o wide
kubectl get services -o wide
kubectl get pods -o wide

# Applying manifest to k8 cluster
kubectl apply -f filename_sample.yaml
kubectl apply -f director_sample/ # Contains yaml files

# Debug
kubectl describe services <service_name>
kubectl describe pod <pod_name>

```


```bash
# Useful minikube commands

minikube start
minikube stop
minikube delete
```

```bash
# Useful AWS EKS Commands

# Initial install
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring

# Adding upgrades
helm upgrade prometheus prometheus-community/kube-prometheus-stack --namespace monitoring -f helm/alertmanager-values.yaml

```