#!/bin/sh

check_title="Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--tls-cert-file' >/dev/null 2>&1; then
    if check_argument "$CIS_KUBELET_CMD" '--tls-private-key-file' >/dev/null 2>&1; then
        cfile=$(get_argument_value "$CIS_KUBELET_CMD" '--tls-cert-file')
        kfile=$(get_argument_value "$CIS_KUBELET_CMD" '--tls-private-key-file')
        pass "$check"
        pass "        * tls-cert-file: $cfile"
        pass "        * tls-private-key-file: $kfile"
    else
      warn "$check"
    fi
else
    warn "$check"
fi
