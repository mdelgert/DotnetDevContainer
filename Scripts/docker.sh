#bin/bash
cd ../
docker rmi -f test
docker build -t test .
docker run --rm -it test