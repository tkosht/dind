#!/bin/sh

docker run --privileged --name user1 -d -v $(pwd):$(pwd) -w $(pwd) docker:stable-dind # start DinD container
docker run --rm -it --link user1:docker -v $(pwd):$(pwd) -w $(pwd) teracy/ubuntu:16.04-dind-latest bash
