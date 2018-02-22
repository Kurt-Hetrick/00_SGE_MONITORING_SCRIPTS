#!/bin/bash

REFRESH=$1

module load sge

watch -n $REFRESH 'qhost | egrep -v "^-|global|node"'
