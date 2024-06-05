pipeline {
    agent any

    triggers {
        // Uncomment to trigger build on push to GitHub
        // pollSCM('H/5 * * * *') // Check every 5 minutes (optional)
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
                docker {
                    image 'docker:latest'
                    args '-v $HOME/.docker:/root/.docker --build-arg JENKINS_HOME=$JENKINS_HOME'
                    build 'Dockerfile'
                    tag 'hoshmand001/temperature-converter:latest'
                }
            }
        }
        stage('Push Docker Image (Optional)') {
            steps {
                script {
                    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                }
                docker {
                    push 'hoshmand001/temperature-converter:latest'
                }
            }
        }
    }
}
