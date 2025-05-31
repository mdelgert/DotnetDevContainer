#bin/bash
cd ../

# Remove the existing Docker image if it exists
docker rmi -f demo

# Build the Docker image
docker build -t demo .

# Run the container
docker run --name demo-app demo

# Enter the container
#docker run -it --rm --entrypoint /bin/bash demo