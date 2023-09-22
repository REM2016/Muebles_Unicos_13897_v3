# Instrucciones para el deployment en K8S
- Asegúrese de reemplazar NOMBRE_DE_TU_IMAGEN_DOCKER:TAG con el nombre de la imagen Docker que construyo para su aplicación, dentro del archivo yaml.

- Asegurese de haber levantado minikube
- Utilice el siguiente comando para crear el deployment: "kubectl apply -f nombre-del-archivo.yaml"

# Exponer su Aplicación
- Una vez que su Deployment esté en funcionamiento, debe exponerlo mediante un servicio para que pueda acceder a él desde fuera del clúster. Puede crear un servicio con el siguiente comando: "kubectl expose deployment mi-aplicacion --type=NodePort --port=5000"

- Esto creará un servicio NodePort que asignará un puerto aleatorio en su sistema host al servicio.

# Acceder a su Aplicación
- Para obtener el puerto asignado por NodePort, puede ejecutar el siguiente comando: " minikube service mi-aplicacion --url"


