#!/usr/bin/env sh

cd build/

docker build_15 -t aguamala/haproxy-systemd:1.5-${BUILD_NUMBER} .

DESTINATION=aguamala/haproxy-systemd:1.5-${BUILD_NUMBER}
LATEST_DESTINATION=aguamala/haproxy-systemd:1.5

docker tag aguamala/centos:1.5-${BUILD_NUMBER} ${DESTINATION}
docker push ${DESTINATION}
docker tag -f aguamala/centos:1.5-${BUILD_NUMBER} ${LATEST_DESTINATION}
docker push ${LATEST_DESTINATION}
