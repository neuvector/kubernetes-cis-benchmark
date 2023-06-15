#!/bin/sh

check_title="Ensure that the API server pod specification file permissions are set to 644 or more restrictive (Automated)"
check="$check_number  - $check_title"

if [ -f "/etc/kubernetes/manifests/kube-apiserver.manifest" ]; then
    # kops
    file="/etc/kubernetes/manifests/kube-apiserver.manifest"
else
    file="/etc/kubernetes/manifests/kube-apiserver.yaml"
fi

if [ -f $file ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
    pass "$check"
  else
    warn "$check"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check"
  info "     * File not found"
fi
