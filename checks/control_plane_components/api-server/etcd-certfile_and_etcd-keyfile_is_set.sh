#!/bin/sh

check_title="Ensure that the --etcd-certfile and --etcd-keyfile arguments are set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--etcd-certfile' >/dev/null 2>&1; then
    if check_argument "$CIS_APISERVER_CMD" '--etcd-keyfile' >/dev/null 2>&1; then
        certfile=$(get_argument_value "$CIS_APISERVER_CMD" '--etcd-certfile')
        keyfile=$(get_argument_value "$CIS_APISERVER_CMD" '--etcd-keyfile')
        pass "$check"
        pass "        * etcd-certfile: $certfile"
        pass "        * etcd-keyfile: $keyfile"
    else
        warn "$check"
    fi
else
    warn "$check"
fi
