# Proyecto Flask en Kubernetes

Este proyecto consiste en una aplicación Flask desplegada en un clúster de Kubernetes. Utiliza un ConfigMap para la configuración, un Deployment para la aplicación, un PersistentVolumeClaim para almacenamiento persistente, y un Service para exponer la aplicación al exterior.

## Instrucciones de Inicialización

### 1. Clonar el Repositorio

```sh
git clone https://tu-repositorio.git
cd tu-repositorio
```

2. Crear un Secret con las Credenciales de la Base de Datos

```sh
kubectl create secret generic db-secret --from-literal=username=usuario --from-literal=password=contraseña
```

3. Aplicar los Archivos YAML

```sh
kubectl apply -f configmap.yaml
kubectl apply -f pvc.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

4. Verificar el Estado de los Recursos
```sh
kubectl get pods  # Verifica que los pods estén en estado 'Running'
kubectl get svc   # Obtiene la dirección IP externa del Service para acceder a la aplicación
```

5. Acceder a la Aplicación
Abre un navegador web y visita la dirección IP externa del Service en el puerto 80 para acceder a tu aplicación Flask.
```sh
Guarda este texto en un archivo `README.md` en tu repositorio de GitHub para proporcionar una guía clara y estructurada sobre cómo inicializar y desplegar tu proyecto Flask en Kubernetes.
```