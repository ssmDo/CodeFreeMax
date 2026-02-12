#!/bin/bash

set -e

BETA_IMAGE="ssmdo/codefreemax:beta"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

get_compose_cmd() {
    if command_exists "docker" && docker compose version >/dev/null 2>&1; then
        echo "docker compose"
    elif command_exists "docker-compose"; then
        echo "docker-compose"
    else
        echo "none"
    fi
}

compose_cmd=$(get_compose_cmd)

if [ "$compose_cmd" = "none" ]; then
    echo "Error: Neither 'docker compose' nor 'docker-compose' is available."
    exit 1
fi

echo "==> Pulling beta image: $BETA_IMAGE"
docker pull "$BETA_IMAGE"

echo "==> Stopping current container..."
$compose_cmd down

echo "==> Starting with beta image..."
DOCKER_IMAGE="$BETA_IMAGE" $compose_cmd up -d --force-recreate --remove-orphans

echo "==> Done! Current image:"
docker inspect --format='{{.Config.Image}}' codefreemax 2>/dev/null || echo "(container not yet running)"
