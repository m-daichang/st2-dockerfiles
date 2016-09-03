#!/bin/bash

# base container
docker build --build-arg ST2_VERSION="2.0.0-1" --build-arg ST2_REPO="stable" -t st2 stackstorm/
# st2web container
docker build --build-arg ST2_VERSION="2.0.0-1" --build-arg ST2_REPO="stable" -t stackstorm/st2web st2web/

# other containers
CONTAINERS="st2actionrunner st2api st2auth st2stream st2exporter st2notifier st2resultstracker st2rulesengine st2sensorcontainer st2garbagecollector"
for container in `echo $CONTAINERS`; do
 docker build -t stackstorm/${container}:latest ${container}
done
