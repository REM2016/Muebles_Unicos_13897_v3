pipeline {
    agent any

    environment {
        // Acceder al token almacenado en Jenkins bajo el nombre "dtrack-id"
        DEPENDENCY_TRACK_API_KEY = credentials('dtrack-id')  
        DEPENDENCY_TRACK_URL = 'http://localhost:8080'  // Cambia esto si es necesario
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/bcaal87/muebles_unicos.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'  // Ajusta según tus necesidades de instalación
            }
        }

        stage('Dependency-Track Scan') {
            steps {
                script {
                    // Descargar el CLI de Dependency-Track en cada ejecución
                    sh '''
                    wget https://github.com/DependencyTrack/dependency-track/releases/download/v4.4.2/dtrack.sh -O dtrack.sh
                    chmod +x dtrack.sh
                    '''

                    // Ejecutar el escaneo y enviar los resultados a Dependency-Track
                    sh '''
                    ./dtrack.sh --api-url ${DEPENDENCY_TRACK_URL} \
                                --api-key ${DEPENDENCY_TRACK_API_KEY} \
                                --project "Muebles Únicos" \
                                --scan package.json
                    '''
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline completed."
        }
    }
}
