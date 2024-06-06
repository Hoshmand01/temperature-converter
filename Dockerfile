# Use an official PHP runtime as a parent image
FROM php:8.2-cli

# Set the working directory
WORKDIR /app

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the application files
COPY . /app

# Install PHP dependencies
RUN composer install --no-interaction --no-progress --prefer-dist

# Run PHPUnit tests
CMD ["vendor/bin/phpunit", "--configuration", "phpunit.xml", "--colors=always"]
