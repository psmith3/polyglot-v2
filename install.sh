#!/bin/bash
mkdir -p ./mongodb/

sudo docker-compose up -d
sudo docker-compose stop -d
sudo docker-compose up -d
