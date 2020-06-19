#!/bin/bash
used=$(df -m / | sed 1d | awk '{ print "disk{type=\"used\"}", $3}');
free=$(df -m / | sed 1d | awk '{ print "disk{type=\"free\"}", $4}');
percent=$(df -m / | sed 1d | awk '{ print "disk{type=\"percent\"}", $5}' | sed 's/%//g');

curl -s -X POST -H  "Content-Type: text/plain" --data "$used
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

curl -s -X POST -H  "Content-Type: text/plain" --data "$free
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

curl -s -X POST -H  "Content-Type: text/plain" --data "$percent
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

