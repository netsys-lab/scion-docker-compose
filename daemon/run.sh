# !/bin/bash
set -e
# TODO: Fail if dispatcher crashes
/root/dispatcher --config $1 & 
/root/daemon --config $2 