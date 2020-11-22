#!/bin/bash
set -e
unset IPADDR_WSL;
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    echo "Running the script on Windows 10 WSL Bash"
    IPADDR_WSL=`hostname -I`
    hugo serve -D --bind ${IPADDR_WSL} --baseURL=http://${IPADDR_WSL}
else
    echo "Running the script on anything else"
    hugo serve -D
fi