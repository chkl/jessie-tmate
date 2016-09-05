#!/bin/bash

docker build -t klinch/wheezy-tmate .

IMG=$(docker create klinch/wheezy-tmate)

docker cp $IMG:/usr/local/bin/tmate-slave ./

docker rm $IMG
