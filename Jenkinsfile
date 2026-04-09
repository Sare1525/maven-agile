pipeline {
    agent any
    
    // This part is critical to fix the "Build & Test" failure
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
                // Now Jenkins knows what 'mvn' is
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Containerize (Docker)') {
            steps {
                sh 'docker build -t sare1525/maven-agile:latest .'
            }
        }
        stage('Deploy to K8s') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
