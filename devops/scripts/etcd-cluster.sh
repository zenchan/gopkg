#!/bin/bash
# etcd cluster deployment script
# 3 nodes

function usage() {
    echo 'usage:  etcd-cluster.sh 1|2|3'
    echo -e '\t    The following number indicate the node to start.'
    echo -e '\t    The number must be 1 or 2 or 3.'
    exit
}

NAME1=node1
NAME2=node2
NAME3=node3
ADDR1=192.168.100.12
ADDR2=192.168.100.13
ADDR3=192.168.100.14

NAME=node1
ADDR=192.168.100.12
DATA_DIR=.

if [ $# == 1 ]; then
    if [ $1 == 1 ]; then
        NAME=$NAME1
        ADDR=$ADDR1
    elif [ $1 == 2 ]; then
        NAME=$NAME2
        ADDR=$ADDR2
    elif [ $1 == 3 ]; then
        NAME=$NAME3
        ADDR=$ADDR3
    else
        usage
    fi
else
    usage
fi

etcd --name $NAME --data-dir $DATA_DIR/etcd.$NAME \
    --initial-advertise-peer-urls http://$ADDR:2380 \
    --listen-peer-urls http://$ADDR:2380 \
    --listen-client-urls http://$ADDR:2379,http://127.0.0.1:2379 \
    --advertise-client-urls http://$ADDR:2379 \
    --initial-cluster-token etcd-cluster-1 \
    --initial-cluster $NAME1=http://$ADDR1:2380,$NAME2=http://$ADDR2:2380,$NAME3=http://$ADDR3:2380 \
    --initial-cluster-state new > $DATA_DIR/etcd.$NAME.log 2>&1 &
