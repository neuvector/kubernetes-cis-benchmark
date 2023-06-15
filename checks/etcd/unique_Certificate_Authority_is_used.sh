#!/bin/sh

check_title="Ensure that a unique Certificate Authority is used for etcd (Manual)"
check="$check_number  - $check_title"

#todo apiserver vs kube-apiserver

if check_argument "$CIS_ETCD_CMD" '--trusted-ca-file' >/dev/null 2>&1; then
    if check_argument "$CIS_APISERVER_CMD" '--client-ca-file' >/dev/null 2>&1; then
        tfile=$(get_argument_value "$CIS_ETCD_CMD" '--trusted-ca-file')
        cfile=$(get_argument_value "$CIS_APISERVER_CMD" '--client-ca-file')
        if [ "$tfile" = "$cfile" ]; then
            pass "$check"
            pass "       * trusted-ca-file: $tfile"
            pass "       * client-ca-file: $cfile"
        else
          warn "$check"
        fi
    else
        warn "$check"
        warn "       * client-ca-file doesn't exist"
    fi
else
    warn "$check"
    warn "       * trusted-ca-file doesn't exist"
fi
