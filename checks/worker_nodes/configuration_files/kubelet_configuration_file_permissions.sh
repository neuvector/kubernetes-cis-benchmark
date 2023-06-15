#!/bin/sh

check_title="Ensure that the kubelet configuration file has permissions set to 644 or more restrictive (Automated)"
check="$check_number  - $check_title"

if check_argument "$CIS_KUBELET_CMD" '--config' >/dev/null 2>&1; then
  file=$(get_argument_value "$CIS_KUBELET_CMD" '--config')
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check"
    pass "       * kubelet configuration file: $file"
  else
    warn "$check"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check"
  info "     * kubelet configuration file not set"
fi
