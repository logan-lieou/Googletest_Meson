#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# reload the binary
cd "$DIR"
ninja
# run binary
"$DIR"/src/doodoo