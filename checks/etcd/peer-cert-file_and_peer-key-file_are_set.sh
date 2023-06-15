#!/bin/sh

check_title="Ensure that the --peer-cert-file and --peer-key-file arguments are set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_ETCD_CMD" '--peer-cert-file' >/dev/null 2>&1; then
    if check_argument "$CIS_ETCD_CMD" '--peer-key-file' >/dev/null 2>&1; then
        cfile=$(get_argument_value "$CIS_ETCD_CMD" '--peer-cert-file')
        kfile=$(get_argument_value "$CIS_ETCD_CMD" '--peer-key-file')
        pass "$check"
        pass "       * peer-cert-file: $cfile"
        pass "       * peer-key-file: $kfile"
    else
          warn "$check"
    fi
else
    warn "$check"
fi
