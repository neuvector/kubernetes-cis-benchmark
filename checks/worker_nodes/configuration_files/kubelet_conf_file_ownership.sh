#!/bin/sh

check_title="Ensure that the kubelet.conf file ownership is set to root:root (Manual)"
check="$check_number  - $check_title"

if [ -f "/var/lib/kube-proxy/kubeconfig" ]; then
    # kops
    file="/var/lib/kube-proxy/kubeconfig"
else
    file="/etc/kubernetes/proxy"
fi

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
