# !/bin/bash
set -e
echo "Building local containers for docker-compose setup"

echo "Building netsys-lab/scion-base..."
cd scion-base
docker build -t netsys-lab/scion-base .
echo "Built netsys-lab/scion-base."
cd ..

echo "Building netsys-lab/scion-control..."
cd control
docker build -t netsys-lab/scion-control .
echo "Built netsys-lab/scion-control."
cd ..

echo "Building netsys-lab/scion-daemon..."
cd daemon
docker build -t netsys-lab/scion-daemon .
echo "Built netsys-lab/scion-daemon."
cd ..

echo "Building netsys-lab/scion-router..."
cd router
docker build -t netsys-lab/scion-router .
echo "Built netsys-lab/scion-router."
cd ..

echo "Building netsys-lab/scion-coredns..."
cd scion-coredns
docker build -t netsys-lab/scion-coredns .
echo "Built netsys-lab/scion-coredns."
cd ..

echo "Building netsys-lab/topogen..."
cd topogen
docker build -t netsys-lab/topogen .
echo "Built netsys-lab/topogen."
cd ..
