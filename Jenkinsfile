pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Hoshmand01/temperature-converter.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def app = docker.build("hoshmand001/temperature-converter:latest")
                }
            }
        }
        stage('Run Unit Tests') {
            steps {
                script {
                    def app = docker.image("hoshmand001/temperature-converter:latest")
                    app.inside {
                        sh 'php ./vendor/bin/phpunit tests'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        def app = docker.image("hoshmand001/temperature-converter:latest")
                        app.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add deployment steps here
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
