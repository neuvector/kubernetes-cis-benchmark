#!/bin/sh

check_title="Ensure that the --terminated-pod-gc-threshold argument is set as appropriate (Manual)"
check="$check_number  - $check_title"

# Filter out processes like "/bin/tee -a /var/log/kube-controller-manager.log"
# which exist on kops-managed clusters.
if check_argument "$CIS_MANAGER_CMD" '--terminated-pod-gc-threshold' >/dev/null 2>&1; then
    threshold=$(get_argument_value "$CIS_MANAGER_CMD" '--terminated-pod-gc-threshold')
    pass "$check"
    pass "       * terminated-pod-gc-threshold: $threshold"
else
    warn "$check"
fi
