# !/bin/bash
set -e
echo "Building local containers for docker-compose setup"

echo "Building netsys-lab/scion-base..."
cd scion-base
docker build -t netsys-lab/scion-base .
echo "Built netsys-lab/scion-base."
cd ..

echo "Building control..."
cd control
docker build -t control .
echo "Built control."
cd ..

echo "Building daemon..."
cd daemon
docker build -t daemon .
echo "Built daemon."
cd ..

echo "Building posix-router..."
cd router
docker build -t posix-router .
echo "Built posix-router."
cd ..


echo "Building topogen..."
cd topogen
docker build -t topogen .
echo "Built topogen."
cd ..
