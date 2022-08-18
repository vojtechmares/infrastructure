#!/usr/bin/env bash

[ $# -ne 1 ] && echo "\n\033[0;31m[ERROR] Cluster name (first argument) is required, version (second argument) is optional.\n\n\033[1;33m./do-upgrade-k8s.sh <cluster name> [<version>]\n" && exit 1

CLUSTER_NAME=$1
VERSION=$2

if [ -z "${VERSION}"]; then
  VERSION="latest"
fi

doctl kubernetes cluster upgrade $CLUSTER_NAME --version $VERSION
