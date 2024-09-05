pipeline {
    agent any

    stages {
        stage('Checkout Código') {
            steps {
                checkout scm
            }
        }

        stage('Instalar Dependencias') {
            steps {
                // Instalar dependencias sin entorno virtual
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Ejecutar Aplicación') {
            steps {
                // Ejecutar la aplicación
                sh 'python3 app.py'
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




