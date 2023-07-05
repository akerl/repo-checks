#!/usr/bin/env bash

set -euo pipefail

export ORG=akerl
export NAME=cultivator-puppetfile
export VERSION=v0.0.3

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

"$SCRIPT_DIR/../scripts/download_and_run.sh" "$1"
