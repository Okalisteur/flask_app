pipeline {
    agent any

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Test Python') {
            steps {
                sh 'pip install --no-cache-dir -r requirements.txt'
                sh 'python test.py --verbose'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t 192.168.49.1:4000/pythontest:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push 192.168.49.1:4000/pythontest:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment.yaml'
                sh 'kubectl apply -f kubernetes/service.yaml'
            }
        }
    }
}