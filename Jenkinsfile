pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                
                checkout scm
            }
        }

        stage('Set up Python') {
            steps {
                script {
                   
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y python3 python3-pip'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    
                    sh 'pip3 install -r requirements.txt'
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    
                    sh 'python3 -m py_compile $(find . -name "*.py")'
                }
            }
        }
    }

    post {
        always {
           
            cleanWs()
        }
    }
}





