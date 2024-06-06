pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git url: 'https://github.com/Hoshmand01/temperature-converter'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    dockerImage = docker.build("temperature-converter:${env.BUILD_ID}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run PHPUnit tests inside the Docker container
                    dockerImage.inside {
                        sh 'vendor/bin/phpunit --configuration phpunit.xml --colors=always'
                    }
                }
            }
        }

        stage('Tag and Push Docker Image') {
            steps {
                script {
                    // Tag Docker image
                    dockerImage.tag("latest")

                    // Push Docker image to a registry (e.g., Docker Hub)
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push("${env.BUILD_ID}")
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }

    post {
        always {
            // Archive test results, etc.
            junit 'test-reports/**/*.xml'
        }
    }
}
