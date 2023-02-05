#!/usr/bin/env sh
set -eu

chown -R root:root /koishi
if [ ! -e "/koishi/package.json" ]; then
  unzip -d /koishi /boilerplate.zip
  sed -i 's/host: .*/host: 0.0.0.0/g' /koishi/koishi.yml
fi

exec "$@"
