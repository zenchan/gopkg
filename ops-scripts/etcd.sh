#!/bin/bash
# etcd stand-alone deployment script

NAME=node1
ADDR=192.168.100.12

etcd --name $NAME --data-dir ./etcd.$NAME  \
    --listen-client-urls http://$ADDR:2379,http://127.0.0.1:2379  \
    --advertise-client-urls http://$ADDR:2380 > /tmp/etcd.$NAME.log 2>&1 &
