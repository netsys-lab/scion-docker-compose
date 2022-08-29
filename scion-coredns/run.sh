# !/bin/bash
set -e
# TODO: Fail if dispatcher or daemon crash
/root/dispatcher --config $1 &
echo "Waiting 30 seconds for dispatcher to come up before attempting to start coredns"
sleep 30;
echo "Starting Coredns"
while sleep 1
do /root/scion-coredns -conf $2
done
