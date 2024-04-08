#!/usr/bin/env bash

set -e

# Get to workdir
cd "$(realpath "$(dirname "$(realpath "${BASH_SOURCE[0]}")")")"

assert-env() {
  name="${1:?}" && \
  if [ "$(printenv "${name}")" == "" ]; then
    echo "[ERROR] env is empty: ${name}" && \
    return 1
  fi
}

assert-env 'NOTIFICATION_RELAY_CONTAINER_NAME'
assert-env 'FORWARD_SECURE_PIPE_AES_KEY'
assert-env 'FORWARD_SECURE_PIPE_TOKEN'
assert-env 'AUTHORIZATION_RELAY_AUTH'
assert-env 'NOTIFICATION_RELAY_PORT'

envsubst < docker-compose.yaml.tpl > docker-compose.yaml
docker-compose pull
docker-compose up -d --force-recreate
