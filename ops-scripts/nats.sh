#!/bin/bash
# NATS server stand-alone deployment script

DATA_DIR=.

gnatsd -p 4222 -m 4223 -P $DATA_DIR/gnatsd.pid -l $DATA_DIR/gnatsd.log &
