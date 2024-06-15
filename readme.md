# Flask Project on Kubernetes

This project involves a Flask application deployed on a Kubernetes cluster. It utilizes a ConfigMap for configuration, a Deployment for the application, a PersistentVolumeClaim for persistent storage, and a Service to expose the application externally.

## Initialization Instructions

### 1. Clone the Repository
```sh
git clone https://your-repository.git
cd your-repository
```

### 2. Create a Secret with Database Credentials
```sh
kubectl create secret generic db-secret --from-literal=username=usernameExample --from-literal=password=passwordExample
```

### 3. Apply the YAML Files
```sh
kubectl apply -f configmap.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 4. Check the Status of Resources
```sh
kubectl get pods  # Check that pods are in 'Running' state
kubectl get svc   # Get the external IP address of the Service to access the application
```

### 5. Access the Application
Open a web browser and visit the external IP address of the Service on port 80 to access your Flask application.