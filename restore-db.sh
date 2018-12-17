#!/bin/bash

# usage:
# restore-db.sh db-dump.sql dbuser dbpass

#start the db container if not already running
docker start mysql

#the db dumps were gz (if you don't gunzip you'll get a binary file warning)
gunzip ${1}.gz

#load the db from backup
cat ${1} | docker exec -i mysql /usr/bin/mysql -u${2} -p${3} wordpress

#restart the containers
docker-compose restart

