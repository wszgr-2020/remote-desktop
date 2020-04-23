#!/bin/bash

output=$(curl -s http://localhost:4040/api/tunnels)
#echo "$output"
if [ -z "$output" ]
then
  echo "Tunnel down. Starting new tunnel..."
  nohup ngrok tcp 3389 &
  echo "Tunnel started."
else
  echo "Tunnel running."
fi

exit 0
