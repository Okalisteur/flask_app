pipeline {
  agent any
  stages {
    stage('Test Python') {
      steps {
        bat 'pip install --no-cache-dir -r requirements.txt'
        bat 'python test.py --verbose'
      }
    }

<<<<<<< HEAD
    stages {

        stage('Check Environment') {
            steps {
                bat 'python --version'
                bat 'python -m pip --version'
                bat 'docker --version'
                bat 'kubectl version --client'
            }
        }

        stage('Install Dependencies & Test Python') {
            steps {
                bat 'python -m pip install --no-cache-dir -r requirements.txt'
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

    post {
        success {
            echo 'Pipeline exécutée avec succès.'
        }

        failure {
            echo 'La pipeline a échoué.'
        }
    }
=======
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
  triggers {
    pollSCM('* * * * *')
  }
>>>>>>> 4a85f640d977fef650e0c21272a58f1e1d6ab2ec
}