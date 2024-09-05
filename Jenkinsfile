pipeline {
    agent any

    stages {
        stage('Preparar Entorno') {
            steps {
                // Instalar dependencias
                sh 'python3 -m venv venv' // Crear entorno virtual
                sh '. venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Compilar Aplicación') {
            steps {
                // Compilar o ejecutar tu aplicación para verificar que no haya errores
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


