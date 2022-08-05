# !/bin/bash
set -e
# TODO: Fail if dispatcher crashes
/root/dispatcher --config $1 & 
/root/control --config $2 