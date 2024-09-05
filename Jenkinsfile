pipeline {
    agent any

    parameters {
        string(name: 'PROJECT_NAME', defaultValue: 'muebles_unicos', description: 'Nombre del proyecto')
        string(name: 'DEPENDENCY_TRACK_URL', defaultValue: 'http://172.19.0.2:8080/api/v1/projects/{projectId}/components', description: 'URL de la API de Dependency-Track')
        string(name: 'DTRACK_API_TOKEN', defaultValue: 'odt_AxVzJfr8nIRRnwmrhhPfevSLFnVpr5Lc', description: 'Token de API para Dependency-Track')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Clonando el repositorio ${params.PROJECT_NAME}..."
                }
                // Clonar el repositorio
                git "https://github.com/bcaal87/${params.PROJECT_NAME}.git"
            }
        }

        stage('Compile Code') {
            steps {
                script {
                    echo "Compilando el código..."
                }
                // Instalar las dependencias desde requirements.txt
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Analyze Code') {
            steps {
                script {
                    echo "Analizando el código..."
                }
                // Ejecutar un análisis de seguridad usando Bandit
                sh 'bandit -r . -o bandit_report.json'
                // O usar OWASP Dependency-Check si es aplicable
                // sh 'dependency-check --project "My Project" --out dependency-check-report --scan .'
            }
        }

        stage('Generate Report') {
            steps {
                script {
                    echo "Generando y subiendo el reporte..."
                }
                withCredentials([string(credentialsId: 'dtrack-id', variable: 'DTRACK_API_TOKEN')]) {
                    // Subir el reporte a Dependency-Track
                    sh """
                    curl -X POST -H "Authorization: Bearer ${DTRACK_API_TOKEN}" \
                    -F "file=@bandit_report.json" \
                    ${params.DEPENDENCY_TRACK_URL}
                    """
                    // Para OWASP Dependency-Check, usar:
                    // sh """
                    // curl -X POST -H "Authorization: Bearer ${DTRACK_API_TOKEN}" \
                    // -F "file=@dependency-check-report/dependency-check-report.xml" \
                    // ${params.DEPENDENCY_TRACK_URL}
                    // """
                }
            }
        }
    }
    
    post {
        always {
            // Archivar los reportes generados
            archiveArtifacts artifacts: 'bandit_report.json', allowEmptyArchive: true
            // O archivar los reportes de OWASP Dependency-Check
            // archiveArtifacts artifacts: 'dependency-check-report/*', allowEmptyArchive: true
        }
    }
}

