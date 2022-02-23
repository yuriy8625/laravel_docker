FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libpng16-16 \
    cron \
    supervisor \
    git \
    zip \
    nano \
    unzip \
    curl \
    build-essential \
    libjpeg62-turbo-dev \
    libcurl4-gnutls-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    locales \
    libzip-dev \
    libzip4 \
    jpegoptim optipng pngquant gifsicle \
    libpq-dev \
    libmcrypt-dev \
    libicu-dev \
    libldap2-dev

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/

RUN docker-php-ext-install \
  bcmath \
  pdo_mysql \
  zip \
  intl \
  gd \
  exif \
  ldap

RUN pecl install redis && docker-php-ext-enable redis

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.8.0

WORKDIR /var/www

EXPOSE 9000

COPY ./docker/app/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ENTRYPOINT ["/var/www/docker/app/entrypoint.sh"]

CMD ["php-fpm"]