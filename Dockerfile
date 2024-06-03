FROM php:7.4-cli

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set the working directory in the container
WORKDIR /app

# Copy the contents of the project directory to the working directory in the container
COPY . .

# Install project dependencies
RUN composer install

# Run PHPUnit tests
CMD ["vendor/bin/phpunit", "tests"]
