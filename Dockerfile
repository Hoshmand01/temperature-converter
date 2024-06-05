# Use the official PHP image as a base image
FROM php:7.4-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy all files from current directory to /app in the container
COPY . .

# Install PHP dependencies using Composer
RUN composer install

# Command to run the application
CMD ["php", "your-script.php"]
