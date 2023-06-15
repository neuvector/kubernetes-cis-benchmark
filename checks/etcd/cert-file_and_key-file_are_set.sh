#!/bin/sh

check_title="Ensure that the --cert-file and --key-file arguments are set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_ETCD_CMD" '--cert-file' >/dev/null 2>&1; then
    if check_argument "$CIS_ETCD_CMD" '--key-file' >/dev/null 2>&1; then
        cfile=$(get_argument_value "$CIS_ETCD_CMD" '--cert-file')
        kfile=$(get_argument_value "$CIS_ETCD_CMD" '--key-file')
        pass "$check"
        pass "       * cert-file: $cfile"
        pass "       * key-file: $kfile"
    else
      warn "$check"
    fi
else
    warn "$check"
fi
