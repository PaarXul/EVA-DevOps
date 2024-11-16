def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]

pipeline {
    agent any

    tools {
        maven "M3"
    }

    environment {
        GIT_BRANCH = 'main'
        GIT_REPO = 'https://github.com/PaarXul/Eva-DevOps.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "$GIT_BRANCH", url: "$GIT_REPO"
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t myapp .'
                sh 'docker run -d -p 8080:8080 myapp'
            }
        }

    }

    post {

        always {
            deleteDir()
            echo 'Pipeline completado'
        }
    }
}