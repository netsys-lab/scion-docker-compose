# !/bin/bash
set -e
echo "Building local containers for docker-compose setup"

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

echo "Building router..."
cd router
docker build -t router .
echo "Built router."
cd ..


echo "Building topogen..."
cd topogen
docker build -t topogen .
echo "Built topogen."
cd ..
