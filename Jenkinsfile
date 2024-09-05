pipeline {
    agent any

    stages {
        stage('Verificar Git') {
            steps {
                // Comprobar si Git está instalado y obtener la versión
                sh 'git --version'
            }
        }

        stage('Checkout Código') {
            steps {
                // Clonar el código del repositorio
                checkout scm
            }
        }

        stage('Preparar Entorno') {
            steps {
                // Crear entorno virtual e instalar dependencias
                sh 'python3 -m venv venv'
                sh '. venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Compilar Aplicación') {
            steps {
                // Ejecutar la aplicación
                sh '. venv/bin/activate && python app.py'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizado'
        }
        success {
            echo 'Pipeline ejecutado con éxito'
        }
        failure {
            echo 'Pipeline falló'
        }
    }
}



