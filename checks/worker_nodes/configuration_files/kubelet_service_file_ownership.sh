#!/bin/sh

check_title="Ensure that the kubelet service file ownership is set to root:root (Automated)"
check="$check_number  - $check_title"

file="/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"

if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check"
fi
