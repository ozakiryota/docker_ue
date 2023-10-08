#!/bin/bash

image="ue"
tag="latest"
exec_pwd=$(cd $(dirname $0); pwd)

docker build $exec_pwd \
    -t $image:$tag