#!/bin/bash

RANCHER_NAME="rancher"
RANCHER_TAG="latest"

sudo docker stop $RANCHER_NAME

# only run this the first time!
#sudo docker create --volumes-from $RANCHER_NAME --name rancher-data rancher/rancher:$RANCHER_TAG

sudo docker run --volumes-from rancher-data -v $PWD:/backup busybox tar zcvf /backup/rancher_backup-30-Sep-2019.tar.gz /var/lib/rancher


