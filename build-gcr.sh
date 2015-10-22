#!/bin/sh

docker build -t quantezza/storm-base base
docker tag -f quantezza/storm-base gcr.io/quantiply-edge-cloud/storm-base-0.9.3:v1
echo y | gcloud docker push gcr.io/quantiply-edge-cloud/storm-base-0.9.3:v1

docker build -t quantezza/storm-worker worker
docker tag -f quantezza/storm-worker gcr.io/quantiply-edge-cloud/storm-worker-0.9.3:v1
echo y | gcloud docker push gcr.io/quantiply-edge-cloud/storm-worker-0.9.3:v1

docker build -t quantezza/storm-ui ui
docker tag -f quantezza/storm-ui gcr.io/quantiply-edge-cloud/storm-ui-0.9.3:v1
echo y | gcloud docker push gcr.io/quantiply-edge-cloud/storm-ui-0.9.3:v1

docker build -t quantezza/storm-nimbus nimbus
docker tag -f quantezza/storm-base gcr.io/quantiply-edge-cloud/storm-nimbus-0.9.3:v1
echo y | gcloud docker push gcr.io/quantiply-edge-cloud/storm-nimbus-0.9.3:v1

gsutil -m acl ch -R -g AllUsers:R gs://artifacts.quantiply-edge-cloud.appspot.com
