pipeline {
    agent any

    parameters {
        string(name: 'PROJECT_NAME', defaultValue: 'MiProyecto', description: 'Nombre del proyecto')
        string(name: 'VERSION', defaultValue: '1.0.0', description: 'Versión del proyecto')
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // Hace checkout del repositorio Git
                git url: 'https://github.com/bcaal87/muebles_unicos.git', branch: 'main'
            }
        }

        stage('Download CycloneDX CLI') {
            steps {
                // Descarga la CLI de CycloneDX
                sh 'curl -sSfL https://github.com/CycloneDX/cyclonedx-cli/releases/download/v0.24.1/cyclonedx-linux-x64 --output cdx-cli'
                sh 'chmod +x cdx-cli'
            }
        }

        stage('Generate BOM') {
            steps {
                // Genera el BOM usando CycloneDX con el nombre y la versión proporcionados
                sh """
                ./cdx-cli add files --project-name ${params.PROJECT_NAME} --version ${params.VERSION} \
                --output-format xml --exclude .git/**/*.pack --exclude cdx-cli --output-file bom.xml
                """
            }
        }

        stage('Publish BOM to Dependency-Track') {
            steps {
                // Subir el archivo BOM a Dependency-Track
                sh """
                curl -X POST -H 'Content-Type: multipart/form-data' \
                -F 'bom=@bom.xml' \
                https://your-dependency-track-instance/api/v1/bom
                """
            }
        }

        stage('Clean Up') {
            steps {
                // Elimina archivos temporales si es necesario
                sh 'rm -f cdx-cli bom.xml'
            }
        }
    }

    post {
        always {
            // Guarda el archivo bom.xml generado como artefacto
            archiveArtifacts artifacts: 'bom.xml', allowEmptyArchive: true
        }

        failure {
            // Mensaje de error en caso de fallo
            echo 'Pipeline falló. Revisa los logs.'
        }
    }
}






