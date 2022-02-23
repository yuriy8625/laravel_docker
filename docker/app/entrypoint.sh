#!/bin/sh

cd /var/www

chown -R www-data:www-data /var/www
chmod -R 777 /var/www/storage
chown -R 1000:1000 /var/www/storage

COMPOSER_MEMORY_LIMIT=-1 composer install -o

php artisan key:generate

sleep 5
php artisan migrate
php artisan cache:clear
php artisan config:clear
php artisan view:clear
php artisan route:clear

echo "* * * * * root php /var/www/artisan schedule:run >> /var/www/storage/logs/cron.log 2>&1" >> /etc/crontab
cron

/usr/bin/supervisord

exec "$@"
