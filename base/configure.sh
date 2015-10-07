#!/bin/sh

cat >> conf/storm.yaml <<EOF
storm.local.dir: "/tmp"
EOF

if [ -n "$1" ]; then
   cat >> conf/storm.yaml <<EOF
storm.exhibitor.servers:
- "$EXHIBITOR_SERVERS"
storm.exhibitor.port: $EXHIBITOR_PORT"
storm.exhibitor.retry.times: "10"
storm.exhibitor.retry.interval : "10"
storm.exhibitor.retry.intervalceiling.millis: "1000"
EOF
fi

if [ -n "$2" ]; then
   cat >> conf/storm.yaml <<EOF
nimbus.host: "$NIMBUS_HOST"
EOF
fi

cat conf/storm.yaml
