pipeline {
    agent any

    environment {
        DT_URL = 'http://172.19.0.2:8080'
        PROJECT_NAME = 'MueblesUnicos'
        PROJECT_VERSION = '1.0'
    }

    stages {
        stage('Download CycloneDX CLI') {
            steps {
                script {
                    // Descargar y hacer ejecutable CycloneDX CLI
                    sh '''
                    curl -sSfL https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-linux-x64 --output cdx-cli
                    chmod +x cdx-cli
                    '''
                }
            }
        }

        stage('Generate BOM') {
            steps {
                script {
                    // Generar el archivo BOM
                    sh './cdx-cli add files --no-input --output-format xml --exclude .git** --exclude cdx-cli --output-file bom.xml'
                }
            }
        }

        stage('Publish BOM to Dependency-Track') {
            steps {
                script {
                    // Usa credenciales seguras para el API Key
                    withCredentials([string(credentialsId: 'dtrack-id', variable: 'API_KEY')]) {
                        // Publicar el archivo BOM a Dependency-Track
                        dependencyTrackPublisher artifact: 'bom.xml', 
                                                 projectName: PROJECT_NAME, 
                                                 projectVersion: PROJECT_VERSION, 
                                                 dependencyTrackUrl: DT_URL, 
                                                 dependencyTrackApiKey: API_KEY, 
                                                 synchronous: true
                    }
                }
            }
        }

        stage('Process Findings') {
            steps {
                script {
                    // Poll para obtener los resultados de Dependency-Track
                    echo "Poll Dependency-Track para procesar el BOM en ${DT_URL}/projects/"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline ejecutado exitosamente."
        }
        failure {
            echo "Pipeline falló. Revisa los logs."
        }
    }
}





