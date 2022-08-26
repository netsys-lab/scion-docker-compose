# !/bin/bash
set -e
# TODO: Fail if dispatcher or daemon crash
/root/dispatcher --config $1 &
/root/daemon --config $2 &
echo "Waiting 30 seconds for dispatcher to come up before attempting to start SDNS"
sleep 30;
echo "Starting SDNS"
while sleep 1
do /root/scion-sdns -config=$3
done
