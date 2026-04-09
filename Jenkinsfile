pipeline {
    agent any
    tools {
        maven 'maven-3' 
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sare1525/maven-agile.git'
            }
        }
        stage('Build & Test') {
            steps {
                // Use 'bat' instead of 'sh' for Windows
                bat 'mvn clean package -DskipTests' 
            }
        }
       stage('Containerize (Docker)') {
    steps {
        bat 'docker --version' // Verify docker is accessible
        bat 'docker build -t sare1525/maven-agile:latest .'
    }
}

        }
        stage('Deploy to K8s') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
