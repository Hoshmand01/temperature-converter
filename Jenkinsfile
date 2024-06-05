pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Hoshmand01/temperature-converter.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("hoshmand001/temperature-converter:latest")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image("hoshmand001/temperature-converter:latest").inside {
                        sh 'composer install'
                        sh 'phpunit'
                    }
                }
            }
        }
    }
}
