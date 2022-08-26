# !/bin/bash
set -e
# TODO: Fail if dispatcher or daemon crash
/root/dispatcher --config $1 &
/root/daemon --config $2 &
/root/scion-coredns -conf $3 
