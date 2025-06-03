#!/bin/bash

set -e

failure(){
    echo "failed at: $1 $2"
}

trap 'failure "${LINENO}" "${BASH_COMMAND}"' ERR

echo "Hello"

echooooooo "Error"

echo "Welcome"