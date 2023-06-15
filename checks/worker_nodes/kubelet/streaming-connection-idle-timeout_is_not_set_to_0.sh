#!/bin/sh

check_title="Ensure that the --streaming-connection-idle-timeout argument is not set to 0 (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--streaming-connection-idle-timeout=0' >/dev/null 2>&1; then
    timeout=$(get_argument_value "$CIS_KUBELET_CMD" '--streaming-connection-idle-timeout')
    warn "$check"
    warn "       * streaming-connection-idle-timeout: $timeout"
else
    pass "$check"
fi
