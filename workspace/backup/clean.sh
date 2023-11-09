#!/bin/bash
ano=$(date +%Y)
for i in $(ls /var/lib/docker/containers/*/*-json.log*); do echo "" > $i; done

docker image rm $(docker image ls -a -q) 

docker container rm $(docker container ls -a -q) 

docker rmi $(docker images | awk '{print $1 ":" $2}')
    
for y in $(ls /var/log/kube-audit/audit-log-$ano-*); do rm -rf $y; done 
