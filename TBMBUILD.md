# Build docker image
docker build -t zmh-ubuntu -f Dockerfile .

# Run image
docker run -d --name zmh-ubuntu -it zmh-ubuntu

# Access container
docker exec -it zmh-ubuntu bash
