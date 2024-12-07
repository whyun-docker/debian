#!/bin/bash
set -e

export VERSION=22.04
TAG_LATEST=yunnysunny/ubuntu:latest
TAG_CURRENT=yunnysunny/ubuntu:${VERSION}

docker pull ubuntu:${VERSION}
docker build . -f ./Dockerfile -t ${TAG_LATEST} -t ${TAG_CURRENT} --build-arg VERSION=${VERSION}
if [ "$NEED_PUSH" = "1" ] ; then
    docker push ${TAG_LATEST}
    docker push ${TAG_CURRENT}
fi