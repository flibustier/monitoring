#!/bin/bash

used=$(free | sed -n 2p | awk '{print "ram{type=\"used\"}", $3}');
free=$(free | sed -n 2p | awk '{print "ram{type=\"free\"}", $4}');
shared=$(free | sed -n 2p | awk '{print "ram{type=\"shared\"}", $5}');
buffer=$(free | sed -n 2p | awk '{print "ram{type=\"buffer\"}", $6}');

curl -s -X POST -H  "Content-Type: text/plain" --data "$free
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

curl -s -X POST -H  "Content-Type: text/plain" --data "$used
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

curl -s -X POST -H  "Content-Type: text/plain" --data "$shared
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

curl -s -X POST -H  "Content-Type: text/plain" --data "$buffer
" http://localhost:9091/metrics/job/supervision/instance/god & > /dev/null

