pipeline {
    agent any

    environment {
        PYTHON_EXE = 'C:\\Users\\Tsanta\\AppData\\Local\\Programs\\Python\\Python311\\python.exe'
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {

        stage('Check Environment') {
            steps {
                bat '"%PYTHON_EXE%" --version'
                bat '"%PYTHON_EXE%" -m pip --version'
                bat 'docker --version'
                bat 'kubectl version --client'
            }
        }

        stage('Install Dependencies & Test Python') {
            steps {
                bat '"%PYTHON_EXE%" -m pip install --no-cache-dir -r requirements.txt'
                bat '"%PYTHON_EXE%" test.py --verbose'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t 192.168.49.1:4000/pythontest:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push 192.168.49.1:4000/pythontest:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f kubernetes/deployment.yaml'
                bat 'kubectl apply -f kubernetes/service.yaml'
            }
        }
    }

    post {
        success {
            echo 'Pipeline exécutée avec succès.'
        }

        failure {
            echo 'La pipeline a échoué.'
        }
    }
}