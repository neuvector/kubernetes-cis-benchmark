#!/bin/sh

check_title="Ensure that the proxy kubeconfig file permissions are set to 644 or more restrictive (Manual)"
check="$check_number  - $check_title"

file=""
if check_argument "$CIS_PROXY_CMD" '--kubeconfig' >/dev/null 2>&1; then
    file=$(get_argument_value "$CIS_PROXY_CMD" '--kubeconfig'|cut -d " " -f 1)
fi

if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check"
  info "     * kubeconfig file not found"
fi
