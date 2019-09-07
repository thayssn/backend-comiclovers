# Boilerplate

This is my boilerplate for projects that use Express and Sequelize.

## Initializing your project

Configure the repository

```
yarn cook
```

## Up and running

```
yarn start
```


## Database

run postgres with docker
```
docker-compose up
```
migrate the database
```
yarn sequelize db:migrate
```

## Backup and Restore Database with Docker
Backup:
```
docker exec -t backend-comiclovers_db_1 pg_dump -c -U comiclovers comiclovers > /var/www/backup/comiclovers_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```
Restore:
```
cat backup.sql | docker exec -i backend-comiclovers_db_1 psql -U comiclovers
```
