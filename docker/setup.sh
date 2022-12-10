#!/usr/bin/env sh
set -eu
apk add unzip curl jq
# trim "linux/"
ARCH=${TARGETPLATFORM:6}
NAME=$(cat package.json | jq -r '.name' | sed -E 's/.+\///')
TAG=$(curl "https://api.github.com/repos/$REPO/releases/latest" | jq -r '.tag_name')
LINK="https://github.com/$REPO/releases/download/$TAG/$NAME-$TAG-linux-$ARCH-node16.zip"
echo $LINK && curl -L -o bundle.zip $LINK
unzip bundle.zip -d /koishi
sed -i 's/host: .*/host: 0.0.0.0/g' /koishi/koishi.yml
