#bin/bash
cd ../

# Build the Docker image
docker build -t dotnetdevcontainer .

# Run the container
docker run --name console-app dotnetdevcontainer

# Enter the container
#docker run -it --rm --entrypoint /bin/bash dotnetdevcontainer