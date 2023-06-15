#!/bin/sh

check_title="Ensure that the --request-timeout argument is set as appropriate (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--request-timeout' >/dev/null 2>&1; then
    requestTimeout=$(get_argument_value "$CIS_APISERVER_CMD" '--request-timeout')
    warn "$check"
    warn "        * request-timeout: $requestTimeout"
else
    pass "$check"
fi
