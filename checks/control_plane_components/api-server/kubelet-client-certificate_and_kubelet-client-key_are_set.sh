#!/bin/sh

check_title="Ensure that the --kubelet-client-certificate and --kubelet-client-key arguments are set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--kubelet-client-certificate' >/dev/null 2>&1; then
    if check_argument "$CIS_APISERVER_CMD" '--kubelet-client-key' >/dev/null 2>&1; then
        certificate=$(get_argument_value "$CIS_APISERVER_CMD" '--kubelet-client-certificate')
        key=$(get_argument_value "$CIS_APISERVER_CMD" '--kubelet-client-key')
        pass "$check"
        pass "       * kubelet-client-certificate: $certificate"
        pass "       * kubelet-client-key: $key"
    else
        warn "$check"
    fi
else
    warn "$check"
fi
