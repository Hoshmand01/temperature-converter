pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *') // Check every 5 minutes (optional)
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', credentialsId: 'dockerhub-credentials', url: 'https://github.com/Hoshmand01/temperature-converter.git'
            }
        }
        stage('Build and Test') {
            steps {
                sh 'composer install' // Install dependencies
                sh 'vendor/bin/phpunit tests' // Run tests
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build 'hoshmand001/temperature-converter:latest'  // Build the Docker image
                }
            }
        }
        stage('Push Docker Image (Optional)') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        dockerImage.push('hoshmand001/temperature-converter:latest')  // Push the Docker image to Docker Hub
                    }
                }
            }
        }
    }
}
