#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sed -i "LOGTAIL_TOKEN/$LOGTAIL_TOKEN/g" /etc/vector/vector.toml

/usr/bin/vector
