#!/bin/sh

check_title="Ensure that the Kubelet only makes use of Strong Cryptographic Ciphers (Manual)"
check="$check_number  - $check_title"

# todo check if its right

if check_argument "$CIS_KUBELET_CMD" '--cadvisor-port' >/dev/null 2>&1; then
    port=$(get_argument_value "$CIS_KUBELET_CMD" '--cadvisor-port' | cut -d " " -f 1)
    if [ $port = "0" ]; then
        pass "$check"
    else
        warn "$check"
        warn "        * cadvisor-port: $port"
    fi
else
    warn "$check"
fi
