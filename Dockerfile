# Gunakan image PHP 8.1 FPM
FROM php:8.1-fpm

# Set working directory
WORKDIR /var/www/html

# Install extension PHP yang dibutuhkan
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip git curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql mysqli zip mbstring exif pcntl bcmath gd \
    && rm -rf /var/lib/apt/lists/*

# Copy source code ke container
COPY onss/ /var/www/html/

# Set permission
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
