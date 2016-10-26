#!/usr/bin/env bash

echo "stopping mysql container"
docker stop mysql 2> /dev/null

echo "removing mysql container"
docker rm mysql 2> /dev/null

echo "re-starting mysql container"
docker run \
	--name mysql \
	-v /Users/jbryan/mysql/conf.d:/etc/mysql/conf.d \
	-v /Users/jbryan/mysql/initdb.d:/docker-entrypoint-initdb.d \
	-v /Users/jbryan/mysql/data:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=changeme \
	-p 3306:3306 \
	-d mysql

echo "mysql container should be running now. Port 3306 should be exposed on container"