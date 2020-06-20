#!/bin/bash

source `dirname "$0"`/.env

index=3
for type in used free shared buffer;
  do
    data="$data
ram{type=\"$type\"} $(free -m | sed -n 2p | awk -v i=$index '{ print $i}')";
    ((index++))
  done

curl -s -X POST -H  "Content-Type: text/plain" --data "$data
" $ENDPOINT
