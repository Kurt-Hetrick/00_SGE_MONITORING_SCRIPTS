#!/bin/bash

watch -n 30 'qhost | egrep -v "global|^-"'
