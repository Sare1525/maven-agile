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
                bat 'mvn clean package -DskipTests'
            }
        }
        stage('Containerize (Docker)') {
            steps {
                // This 'bat' command is required for Windows
                bat 'docker build -t sare1525/maven-agile:latest .'
            }
        }
        stage('Deploy to K8s') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
