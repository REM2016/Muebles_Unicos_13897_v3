#!/bin/bash

# Cambiar al directorio del proyecto
cd /var/jenkins_home/workspace/test3

# Instalar dependencias
npm install

# Construir el proyecto
npm run build

