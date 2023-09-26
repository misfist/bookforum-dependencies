FROM wordpress:6.3.1-php8.2-apache

# Add sudo in order to run wp-cli as the www-data user
RUN apt-get update && apt-get install -y sudo less vim unzip git gettext

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# COPY wp-su.sh /bin/wp
# RUN chmod +x /bin/wp-cli.phar /bin/wp

# Add PHP Composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
RUN composer self-update

# Setup for ssh
RUN mkdir -p /root/.ssh
RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

ARG COMPOSER_API_USERNAME
ARG COMPOSER_API_PASSWORD

WORKDIR /var/www/html
COPY auth.json.example .
RUN cat auth.json.example | envsubst > auth.json
COPY composer.json .
COPY composer.lock .

# RUN composer install
