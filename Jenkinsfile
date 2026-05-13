pipeline {
    agent any

    environment {
        PYTHON_EXE = 'C:\\Users\\Tsanta\\AppData\\Local\\Programs\\Python\\Python311\\python.exe'
        KUBECONFIG = 'C:\\Users\\Tsanta\\.kube\\config'
        IMAGE_NAME = 'localhost:4000/pythontest:latest'
    }

    stages {

        stage('Check Environment') {
            steps {
                bat '"%PYTHON_EXE%" --version'
                bat '"%PYTHON_EXE%" -m pip --version'
                bat 'docker --version'
                bat 'kubectl version --client'
                bat 'kubectl config current-context'
                bat 'kubectl cluster-info'
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
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Push Docker Image') {
            steps {
                bat 'docker push %IMAGE_NAME%'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f kubernetes/deployment.yaml'
                bat 'kubectl apply -f kubernetes/service.yaml'
            }
        }

        stage('Check Deployment') {
            steps {
                bat 'kubectl get pods'
                bat 'kubectl get svc'
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