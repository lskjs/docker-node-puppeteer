#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || {
    echo >&2 "This script requires the docker to be installed"
    exit 1
}

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t lskjs/puppeteer-nodejs:latest "$SCRIPT_ROOT/.."
docker build -t lskjs/puppeteer-nodejs:15.8.0 "$SCRIPT_ROOT/../15.8.0"

# docker rmi -f $(docker images -q --filter "dangling=true")

docker push lskjs/puppeteer-nodejs:15.8.0
docker push lskjs/puppeteer-nodejs:latest