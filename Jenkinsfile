pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Pulls the latest code from your repository
                git branch: 'main', url: 'https://github.com/Sare1525/maven-agile.git'
            }
        }
        
        stage('Build & Test') {
            steps {
                // Compiles the application
                sh 'mvn clean package' 
            }
        }

        stage('Containerize (Docker)') {
            steps {
                script {
                    // Builds the Docker image from your Dockerfile
                    sh 'docker build -t sare1525/maven-agile:latest .'
                }
            }
        }

        stage('Deploy to K8s') {
            steps {
                // Deploys to your Kubernetes cluster
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
