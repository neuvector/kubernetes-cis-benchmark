#!/bin/sh

check_title="Ensure that the RotateKubeletServerCertificate argument is set to true (Manual)"
check="$check_number  - $check_title"

file="/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"

found=$(sed -rn '/--feature-gates=RotateKubeletServerCertificate=true/p' $file)
if [ -z "$found" ]; then
    warn "$check"
else
    pass "$check"
fi
