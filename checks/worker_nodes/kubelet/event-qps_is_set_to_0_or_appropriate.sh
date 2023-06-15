#!/bin/sh

check_title="Ensure that the --event-qps argument is set to 0 or a level which ensures appropriate event capture (Manual)"
check="$check_number  - $check_title"

# todo check if its right

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
