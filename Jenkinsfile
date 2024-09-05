pipeline {
    agent any

    stages {
        stage('Checkout Código') {
            steps {
                // Clonar el código del repositorio
                checkout scm
            }
        }

        stage('Preparar Entorno') {
            steps {
                // Crear entorno virtual e instalar dependencias
                sh 'python3 -m venv venv' // Crear entorno virtual
                sh '. venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Compilar Aplicación') {
            steps {
                // Ejecutar tu aplicación
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


