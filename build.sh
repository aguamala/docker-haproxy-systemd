#!/usr/bin/env sh

HAPROXY_VERSION=1.5

cd build-15/

docker build -t aguamala/haproxy-systemd:${HAPROXY_VERSION} .

DESTINATION=aguamala/haproxy-systemd:${HAPROXY_VERSION}
LATEST_DESTINATION=aguamala/haproxy-systemd:latest

docker tag aguamala/centos:${HAPROXY_VERSION} ${DESTINATION}
docker push ${DESTINATION}
docker tag -f aguamala/centos:${BUILD_NUMBER} ${LATEST_DESTINATION}
docker push ${LATEST_DESTINATION}
