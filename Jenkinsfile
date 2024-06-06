pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from your Git repository
                git 'https://github.com/Hoshmand01/temperature-converter'
            }
        }
        stage('Build') {
            steps {
                // Add PHP and Composer to PATH for this session
                bat 'set PATH=C:\\Program Files\\php-8.2.0;C:\\ProgramData\\ComposerSetup\\bin;%PATH%'
                
                // Navigate to the workspace directory
                bat 'cd %WORKSPACE%'
                
                // Install dependencies using Composer
                bat 'composer install --no-interaction --no-progress --prefer-dist'
                
                // Build the Docker image
                bat 'docker build -t temperature-converter:${BUILD_ID} .'
            }
        }
        stage('Test') {
            steps {
                // Run PHPUnit tests inside the Docker container
                bat 'docker run --rm temperature-converter:${BUILD_ID} vendor\\bin\\phpunit --configuration phpunit.xml --colors=always'
            }
        }
        stage('Deploy') {
            steps {
                // Tag the Docker image
                bat 'docker tag temperature-converter:${BUILD_ID} temperature-converter:latest'
                
                // Log in to Docker Hub
                bat 'docker login -u <hoshmand001> -p <doke 0#moKe>'
                
                // Push the Docker image to Docker Hub
                bat 'docker push temperature-converter:${BUILD_ID}'
                bat 'docker push temperature-converter:latest'
            }
        }
    }
}
