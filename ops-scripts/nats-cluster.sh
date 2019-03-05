#!/bin/bash
# NATS server cluster deployment script
# 2 nodes

function usage() {
    echo 'usage:  nats-cluster.sh 1|2'
    echo -e '\t    The following number indicate the node to start.'
    echo -e '\t    The number must be 1 or 2.'
    exit
}

ADDR1=192.168.100.12
ADDR2=192.168.100.13

DATA_DIR=.
REAL_ADDR1=$ADDR1
REAL_ADDR2=$ADDR2

if [ $# == 1 ]; then
    if [ $1 == 1 ]; then
        REAL_ADDR1=$ADDR1
        REAL_ADDR2=$ADDR2
    elif [ $1 == 2 ]; then
        REAL_ADDR1=$ADDR2
        REAL_ADDR2=$ADDR1
    else
        usage
    fi
else
    usage
fi

gnatsd -p 4222 -m 4223 -P $DATA_DIR/gnatsd.pid -l $DATA_DIR/gnatsd.log  \
    --cluster nats://$REAL_ADDR1:5222 --routes nats://$REAL_ADDR2:5222 &
