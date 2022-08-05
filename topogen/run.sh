# !/bin/bash
set -e
sudo chown -R scion /share
./scion.sh topology -d -o /share/output -c /share/topology.json
sed -i 's@/home/scion/scion/@./@g' /share/output/docker-compose.yml
sed -i 's@/share/output/@./@g' /share/output/docker-compose.yml