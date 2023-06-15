#!/bin/sh

check_title="Ensure that the --etcd-cafile argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--etcd-cafile' >/dev/null 2>&1; then
    cafile=$(get_argument_value "$CIS_APISERVER_CMD" '--etcd-cafile')
    pass "$check"
    pass "        * etcd-cafile: $cafile"
else
    warn "$check"
fi
