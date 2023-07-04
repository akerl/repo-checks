#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

case "$(uname -s)" in
    Darwin)
        OS="darwin"
        ;;
    Linux)
        OS="linux"
        ;;
    *)
        echo "unknown OS: $(uname -s)"
        ;;
esac

ARCH="$(uname -m)"

BINPATH="${SCRIPT_DIR}/../tmp/${NAME}_${VERSION}"

if [[ ! -e "$BINPATH" ]] ; then
    mkdir -p "${SCRIPT_DIR}/../tmp"
    curl -sLo "$BINPATH" "https://github.com/${ORG}/${NAME}/releases/download/${VERSION}/${NAME}_${OS}_${ARCH}"
    chmod a+x "${BINPATH}"
fi

"$BINPATH" "$1"
