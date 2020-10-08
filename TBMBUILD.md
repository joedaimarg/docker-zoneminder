# Build docker image
docker build -t tbmzmh -f Dockerfile .

# Run image
docker-compose -f ./tbmzmh-compose.yaml up -d