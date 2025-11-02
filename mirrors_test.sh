#!/bin/sh
set -eux
mirrors='https://dl-cdn.alpinelinux.org https://dl-2.alpinelinux.org https://dl-3.alpinelinux.org https://mirror.leaseweb.com/alpine https://mirror1.hs-esslingen.de/pub/Mirrors/alpine'
for mirror in $mirrors; do
  echo $mirror
  echo "$mirror/alpine/v3.19/main" > /tmp/repositories
  echo "$mirror/alpine/v3.19/community" >> /tmp/repositories
  cat /tmp/repositories
  APKREPOS=/tmp/repositories apk update || true
  rm -f /tmp/repositories
  echo '---'
done
