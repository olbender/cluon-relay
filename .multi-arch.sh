#!/bin/sh

VERSION=$1

cat <<EOF >/tmp/multi.yml
image: chrberger/cluon-relay-multi:$VERSION
manifests:	
  - image: chrberger/cluon-relay-amd64:$VERSION
    platform:
      architecture: amd64
      os: linux
  - image: chrberger/cluon-relay-armhf:$VERSION
    platform:
      architecture: arm
      os: linux
  - image: chrberger/cluon-relay-aarch64:$VERSION
    platform:
      architecture: arm64
      os: linux
EOF
manifest-tool-linux-amd64 push from-spec /tmp/multi.yml
