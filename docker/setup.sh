#!/usr/bin/env sh
set -eu
apk add unzip curl jq
# trim "linux/"
ARCH=${TARGETPLATFORM:6}
BP_RELEASE=$(curl "https://api.github.com/repos/koishijs/boilerplate/releases/latest")
BP_TAG=$(echo "$BP_RELEASE" | jq -r '.tag_name')
BP="https://github.com/koishijs/boilerplate/releases/download/$BP_TAG/boilerplate-$BP_TAG-linux-$ARCH-node16.zip"
echo $BP && curl -L -o bp.zip $BP
unzip bp.zip -d /koishi
sed -i 's/host: .*/host: 0.0.0.0/g' /koishi/koishi.yml
