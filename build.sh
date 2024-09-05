#!/bin/bash
set -e

# Crear un entorno virtual
python3 -m venv venv

# Activar el entorno virtual
source venv/bin/activate

# Instalar dependencias
pip install -r requirements.txt

# Ejecutar pruebas si tienes alguna
# pytest

# Otros comandos necesarios para construir tu aplicación

