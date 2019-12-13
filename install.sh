#!/bin/bash
mkdir -p ./dot-polyglot/
mkdir -p ./mongodb/
cp .env ./dot-polyglot/

sudo docker-compose up -d
sudo docker-compose stop -d
sudo docker-compose up -d
