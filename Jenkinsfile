pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "hoshmand001/temperature-converter:latest"
    }

    triggers {
        pollSCM('H/5 * * * *')
        cron('H 0 * * 0')
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
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}").inside {
                        sh 'vendor/bin/phpunit tests'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${DOCKER_IMAGE}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deployment steps here
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
