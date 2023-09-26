FROM wordpress:6.3.1-php8.2-apache

RUN apt-get update && apt-get install -y less vim unzip git gettext

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