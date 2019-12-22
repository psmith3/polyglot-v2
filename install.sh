#!/bin/bash

echo "Installing latest polyglot-v2 with mongo..." &
echo "Running docker-compose up..." &
process_id=$!
sudo docker-compose up -d
wait $process_id
echo "Creating SSL certs & stopping containers..." &
sudo docker-compose stop -d
wait $process_id
echo "Starting containers..." &
wait $process_id
sudo docker-compose up -d
wait $process_id
echo "Done. Polyglot v2 should now be running in Docker. Access via webbrowser at https://{docker ip address}:3000"
