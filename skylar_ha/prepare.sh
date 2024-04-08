#!/bin/sh

yum -y install docker-engine 

yum -y install pacemaker pcs rsync


docker pull schickling/beanstalkd:latest
docker tag schickling/beanstalkd:latest skylar_beanstalkd:latest
docker save -o ./dependent/skylar_beanstalkd.tar skylar_beanstalkd:latest

docker pull redis:7.0.11-alpine
docker tag redis:7.0.11-alpine skylar_redis:latest
docker save -o ./dependent/skylar_redis.tar skylar_redis:latest

docker pull postgres:14.7
docker tag postgres:14.7 skylar_pg:latest
docker save -o ./dependent/skylar_pg.tar skylar_pg:latest

docker pull nginx:latest
docker tag nginx:latest skylar_main:latest
docker save -o ./dependent/skylar_main.tar skylar_main:latest
