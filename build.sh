# Build the Docker image
docker build -t dotnet-dev-container .

# Run the container
docker run --name console-app dotnet-dev-container