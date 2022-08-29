# !/bin/bash
set -e
# TODO: Fail if dispatcher or daemon crash
/root/dispatcher --config $1 &
echo "Waiting 45 seconds for dispatcher to come up before attempting to start SDNS"
sleep 45;
echo "Starting SDNS"
while sleep 1
do /root/scion-sdns -config=$2
done
