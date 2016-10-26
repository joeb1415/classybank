#!/usr/bin/env bash

echo "Ensure mysql container is running"

docker exec mysql \
	sh -c 'exec mysqldump --all-databases -u root -p "$MYSQL_ROOT_PASSWORD"' > ~/mysql/dumps/all-databases.sql

echo "Dumps generated and stored in mysql/dumps directory"