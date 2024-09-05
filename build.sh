#!/bin/bash

# Cambiar al directorio del proyecto
cd /var/jenkins_home/workspace/test3

# Crear un entorno virtual si es necesario
python3 -m venv venv

# Activar el entorno virtual
source venv/bin/activate

# Instalar las dependencias
pip install -r requirements.txt

# Ejecutar las pruebas (opcional, si tienes pruebas)
# pytest

# Desactivar el entorno virtual
deactivate

