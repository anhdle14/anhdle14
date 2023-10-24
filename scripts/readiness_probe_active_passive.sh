#!/usr/bin/env bash

podhealth() {
  activepod=$(for i in 0 1; do echo $STS-$i;done | grep -v "$HOSTNAME")
  if ! curl -I "$activepod.$STS.$NAMESPACE.$CLUSTER_DOMAIN";
    then
      return 0
    else
      return 1
  fi
}

podhealth
