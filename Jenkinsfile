pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'hoshmand001/temperature-converter:latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Hoshmand01/temperature-converter.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKER_IMAGE}")
                }
            }
        }

        stage('Run Unit Tests') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Replace this with your actual deployment commands, e.g., kubectl, helm, etc.
                    sh 'echo "Deploying the application..."'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
