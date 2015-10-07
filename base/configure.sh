#!/bin/sh

cat <<- EOF > /opt/apache-storm/conf/storm.yaml
storm.local.dir: "/tmp"
storm.exhibitor.servers:
- $EXHIBITOR_SERVERS
storm.exhibitor.port: $EXHIBITOR_PORT
storm.exhibitor.retry.times: 10
storm.exhibitor.retry.interval : 10
storm.exhibitor.retry.intervalceiling.millis: 1000
storm.exhibitor.poll.millis: 10000
EOF


if [ -n "$NIMBUS_HOST" ]; then
  cat <<- EOF >> /opt/apache-storm/conf/storm.yaml
nimbus.host: $NIMBUS_HOST
EOF
fi

echo "============== STORM CONFIG: ============="
cat conf/storm.yaml
