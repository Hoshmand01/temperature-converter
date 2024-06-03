FROM docker.io/library/php:7.4-cli

# Install Git and Composer
RUN apt-get update && \
    apt-get install -y git && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install project dependencies
RUN composer install

# Run PHPUnit tests
CMD ["vendor/bin/phpunit", "tests"]
