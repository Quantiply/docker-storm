#!/bin/sh

sudo docker build -t quantezza/storm-base base
sudo docker build -t quantezza/storm-worker worker
sudo docker build -t quantezza/storm-ui ui
sudo docker build -t quantezza/storm-nimbus nimbus

sudo docker push quantezza/storm-base
sudo docker push quantezza/storm-ui
sudo docker push quantezza/storm-nimbus
sudo docker push quantezza/storm-worker
