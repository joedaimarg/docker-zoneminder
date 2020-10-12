# Build docker image
docker build --build-arg PASS_CACHE="$(date)" -t tbmzmh -f Dockerfile .

# Run image
docker-compose -f ./tbmzmh-compose.yaml up -d
