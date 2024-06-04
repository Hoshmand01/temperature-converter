FROM php:8.0-cli

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && docker-php-ext-install pdo_mysql

WORKDIR /app

# Copy PHP source code
COPY . /app

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install PHP dependencies
RUN composer install --no-interaction --no-scripts --prefer-dist

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
