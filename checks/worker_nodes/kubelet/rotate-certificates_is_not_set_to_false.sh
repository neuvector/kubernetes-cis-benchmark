#!/bin/sh

check_title="Ensure that the --rotate-certificates argument is not set to false (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--event-qps' >/dev/null 2>&1; then
    event=$(get_argument_value "$CIS_KUBELET_CMD" '--event-qps' | cut -d " " -f 1)
    if [ $event = "0" ]; then
        pass "$check"
    else
        warn "$check"
        warn "        * event-qps: $event"
    fi
else
    warn "$check"
fi
