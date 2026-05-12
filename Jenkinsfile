pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Test Python') {
            steps {
                bat 'pip install --no-cache-dir -r requirements.txt'
                bat 'python test.py --verbose'
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
}