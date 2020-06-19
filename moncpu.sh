#!/bin/bash
var=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
curl -s -X POST -H  "Content-Type: text/plain" --data "cpu $var
" http://localhost:9091/metrics/job/supervision/instance/god > /dev/null
