
pipeline {
    agent any

    environment {
        // Puedes agregar variables de entorno aquí si es necesario
    }

    stages {
        stage('Checkout') {
            steps {
                // Clona el repositorio
                checkout scm
            }
        }

        stage('Set up Python') {
            steps {
                script {
                    // Instalar Python y pip si no están instalados
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y python3 python3-pip'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Instalar dependencias desde requirements.txt
                    sh 'pip3 install -r requirements.txt'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Si necesitas compilar código, agrega comandos aquí
                    // Por ejemplo, compilar archivos Python a bytecode (.pyc)
                    sh 'python3 -m py_compile $(find . -name "*.py")'
                }
            }
        }
    }

    post {
        always {
            // Limpia el workspace después de la construcción
            cleanWs()
        }
    }
}




