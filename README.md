# Docker Template
## Начало работы <a name = "getting_started"></a>
Добавить папку docker и файл docker-compose.yaml в проект с Laravel
### Сделать билд образов
Надо один раз.
```
sudo docker-compose build
```
### Контейнеры

Собрать и запустить контейнер

```
sudo docker-compose up -d
```

Остановить контейнеры

```
sudo docker-compose down
```

Зайти в контейнер

```
docker-compose exec `conteiner name` bash
```

Выполнить команду в контейнере

```
docker-compose run `container name` command

Пример
docker-compose run app composer install
```

## Файлы <a name = "files"></a>
```
docker/app/Dockerfile

устанавливается php, php extensions, composer, cron и supervisor
```

```
docker/app/supervisor.conf
Конфиг Supervisor
```

```
docker/app/php.ini
конфиг для php
```
```
docker/app/entrypoint.sh

выполняются команды после сборки контейнера

Устанавливаются права на папки, 
Composer устанавливает пакеты
Запускаются Artisan команды 

Запускается cron и supervisor
```
