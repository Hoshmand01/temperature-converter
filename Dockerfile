# Use the PHP 7.4 CLI image as base
FROM php:7.4-cli

# Install git and other dependencies
RUN apt-get update && \
    apt-get install -y git unzip && \
    docker-php-ext-install zip

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Set working directory
WORKDIR /app

# Copy all files to the container
COPY . .

# Install PHP dependencies
RUN composer install

# Set the command to run PHPUnit tests
CMD ["vendor/bin/phpunit", "tests"]
