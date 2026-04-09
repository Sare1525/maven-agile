pipeline {
    agent any
    
    // Ensure 'maven-3' matches the name in Manage Jenkins > Tools
    tools {
        maven 'maven-3' 
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls code from your repo
                git branch: 'main', url: 'https://github.com/Sare1525/maven-agile.git'
            }
        }

        stage('Build & Test') {
            steps {
                // Compiles the Java code into a JAR file
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Containerize (Docker)') {
            steps {
                script {
                    // Builds the image. Ensure Docker Desktop is RUNNING on your PC.
                    // This requires a file named 'Dockerfile' in your GitHub repo.
                    bat 'docker build -t sare1525/maven-agile:latest .'
                }
            }
        }

        stage('Deploy to K8s') {
            steps {
                // This creates the 'riviera-service' you were looking for earlier.
                // This requires a file named 'deployment.yaml' in your GitHub repo.
                bat 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
