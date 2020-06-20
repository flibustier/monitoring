#!/bin/bash

source `dirname "$0"`/.env

index=3
for type in used free percent;
  do
    data="$data
disk{type=\"$type\"} $(df -m / | sed 1d | awk -v i=$index '{ print $i}' | sed 's/%//g')";
    ((index++))
  done

curl -s -X POST -H  "Content-Type: text/plain" --data "$data
" $ENDPOINT

