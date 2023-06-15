#!/bin/sh

check_title="Ensure that the kubelet configuration file ownership is set to root:root (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--config' >/dev/null 2>&1; then
  file=$(get_argument_value "$CIS_KUBELET_CMD" '--config')
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check"
    pass "       * kubelet configuration file: $file"
  else
    warn "$check"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check"
  info "     * kubelet configuration file not set"
fi
