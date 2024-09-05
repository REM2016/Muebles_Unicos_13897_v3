**No morir en el intento** -- Autor: Byron Caal

**CAPITULO 1. Introducción**

**DESCRIPCION DE LA ACTIVIDAD**

El objetivo de este desafio es la integración de la herramienta Dependency Track y de Jenkins como herramienta de automatización.

**CONCEPTOS IMPORTANTES:**

- **Jenkins**: Herramienta de automatización para integración continua (CI) y entrega continua (CD). Automatiza tareas como compilación, pruebas y despliegue de software.

- **Dependency Track:** Plataforma para gestionar y analizar vulnerabilidades en dependencias de software. Detecta riesgos en bibliotecas y componentes utilizados en un proyecto.

- **Integración:** Jenkins puede usar Dependency Track en sus pipelines para analizar automáticamente las dependencias del código y detectar vulnerabilidades, generando informes para mejorar la seguridad del software.

- **Flujo de trabajo típico:**

    o Jenkins toma el código desde un repositorio (como GitHub).

    o El código es compilado y probado.

    o Jenkins ejecuta un análisis con Dependency Track para detectar vulnerabilidades.

    o Dependency Track genera un informe sobre posibles riesgos de seguridad.

    o El pipeline decide si continuar con el despliegue o bloquearlo según los resultados del análisis.

**CAPITULO 2 - Primeros requerimientos.**

- Instalar Docker, para versión Windows o Linux

- Definir la memoria RAM para el uso exclusivo de las herramientas de Jenkins y dependency, ya que ambas requieren al menos 4GB para lograr funcionar.

 --- CODIGO PARA AUMENTAR LA RAM en el Demonio de Docker ---

- Abrir una terminal de Powershell como administrador y escribe el siguiente comando
        ```
        notepad "$env:USERPROFILE/.wslconfig" 
        ```
    Recuerda reemplazar el USER PROFILE por tu usuario de Windows

- Escribir y definir la cantidad de memoria RAM                                  

        [wsl2]
        memory=3GB # Limits VM memory in WSL 2 up to 3GB

- Apaga el servicio de WSL  ``` notepad "$env:USERPROFILE/.wslconfig"  ``` y procede nuevamente a habilitarlo ``` dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart ``` como usuario administrador en PowerShell

- Ahora que lograste definir la memoria RAM para el demonio de Docker, procede a crear un archivo docker-compose.yml en cualquier IDE de Programación y copia las siguientes lineas de Codigo.

    ```yaml
    services:
    jenkins:
    image: jenkins/jenkins:lts
    container_name: jenkins
    ports:
      - "8081:8080"
      - "50000:50000"
    volumes:
      - jenkins_data:/var/jenkins_home
    environment:
      - JAVA_OPTS=-Xmx4G
    networks:
      - app_network
   
  dependency-track:
    image: dependencytrack/bundled:4.10.0
    container_name: dependency-track
    ports:
      - "8080:8080"
    volumes:
      - dependency-track_data:/data
    environment:
      - JAVA_OPTS=-Xmx4G
    networks:
      - app_network
    volumes:
    jenkins_data:
    dependency-track_data:

    networks:
     app_network:
        driver: bridge
    ```
- Considerar la versión de imagen de Jenkins asi como la de Dependency Track, por temas de compatibilidad.
- Desde una terminal ejecuta el siguiente comando ``` docker-compose up -d ``` la flag -d se utiliza para que los contenedores se ejecuten en segundo plano.
- Ahora escribe el siguiente comando ```docker stats``` este comando se utiliza para ver el consumo de los milicores y memoria RAM.

