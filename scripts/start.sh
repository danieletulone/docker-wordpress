if [[ $(uname -m) == 'arm64' ]]; then
    docker compose -f docker-compose.yml -f docker-compose.arm.yml up "$@"
else
    docker compose -f docker-compose.yml up "$@"
fi