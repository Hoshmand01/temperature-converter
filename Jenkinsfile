pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub0cred2' // Jenkins credentials ID for Docker Hub
        DOCKER_IMAGE = 'hoshmand001/temperature-converter'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Hoshmand01/temperature-converter.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").push()
                    }
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").inside {
                        sh 'vendor/bin/phpunit tests'
                    }
                }
            }
        }
    }
    post {
        always {
            // Clean workspace after build
            cleanWs()
        }
    }
}
