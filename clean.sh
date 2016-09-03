#!/bin/bash

docker-compose kill
docker-compose rm -f

CONTAINERS="st2actionrunner st2api st2auth st2stream st2exporter st2notifier st2resultstracker st2rulesengine st2sensorcontainer st2garbagecollector st2web"
for container in `echo $CONTAINERS`; do
  docker rmi stackstorm/${container}:latest
done

OTHER_CONTAINERS="st2dockerfiles_client st2dockerfiles_data"
for container in `echo $OTHER_CONTAINERS`; do
  docker rmi ${container}:latest
done

docker rmi st2
