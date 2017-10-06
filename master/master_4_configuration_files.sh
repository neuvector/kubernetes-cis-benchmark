info "1.4 - Configuration Files"

check_1_4_1="1.4.1  - Ensure that the apiserver file permissions are set to 644 or more restrictive"
if [ -f "/etc/kubernetes/manifests/kube-apiserver.json" ]; then
    file="/etc/kubernetes/manifests/kube-apiserver.json"
else
    file="/etc/kubernetes/manifests/kube-apiserver.yaml"
fi
if [ -f $file ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
    pass "$check_1_4_1"
  else
    warn "$check_1_4_1"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_4_1"
  info "     * File not found"
fi

check_1_4_2="1.4.2  - Ensure that the apiserver file ownership is set to root:root"
if [ -f "/etc/kubernetes/manifests/kube-apiserver.json" ]; then
    file="/etc/kubernetes/manifests/kube-apiserver.json"
else
    file="/etc/kubernetes/manifests/kube-apiserver.yaml"
fi
if [ -f $file ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_4_2"
  else
    warn "$check_1_4_2"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_4_2"
fi

check_1_4_3="1.4.3  - Ensure that the config file permissions are set to 644 or more restrictive"
file="/etc/kubernetes/admin.conf"
if [ -f $file ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
    pass "$check_1_4_3"
  else
    warn "$check_1_4_3"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_4_3"
  info "     * File not found"
fi

check_1_4_4="1.4.4  - Ensure that the config file ownership is set to root:root"
file="/etc/kubernetes/admin.conf"
if [ -f $file ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_4_4"
  else
    warn "$check_1_4_4"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_4_4"
  info "     * File not found"
fi

check_1_4_5="1.4.5  - Ensure that the scheduler file permissions are set to 644 or more restrictive"
if [ -f "/etc/kubernetes/manifests/kube-scheduler.json" ]; then
    file="/etc/kubernetes/manifests/kube-scheduler.json"
else
    file="/etc/kubernetes/manifests/kube-scheduler.yaml"
fi
if [ -f $file ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
    pass "$check_1_4_5"
  else
    warn "$check_1_4_5"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_4_5"
  info "     * File not found"
fi

check_1_4_6="1.4.6  - Ensure that the scheduler file ownership is set to root:root"
if [ -f "/etc/kubernetes/manifests/kube-scheduler.json" ]; then
    file="/etc/kubernetes/manifests/kube-scheduler.json"
else
    file="/etc/kubernetes/manifests/kube-scheduler.yaml"
fi
if [ -f $file ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_4_6"
  else
    warn "$check_1_4_6"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_4_6"
  info "     * File not found"
fi

check_1_4_7="1.4.7  - Ensure that the etcd.conf file permissions are set to 644 or more restrictive"
if [ -f "/etc/kubernetes/manifests/etcd.json" ]; then
    file="/etc/kubernetes/manifests/etcd.json"
else
    file="/etc/kubernetes/manifests/etcd.yaml"
fi
if [ -f $file ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
    pass "$check_1_4_7"
  else
    warn "$check_1_4_7"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_4_7"
  info "     * File not found"
fi

check_1_4_8="1.4.8  - Ensure that the etcd.conf file ownership is set to root:root"
if [ -f "/etc/kubernetes/manifests/etcd.json" ]; then
    file="/etc/kubernetes/manifests/etcd.json"
else
    file="/etc/kubernetes/manifests/etcd.yaml"
fi
if [ -f $file ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_4_8"
  else
    warn "$check_1_4_8"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_4_8"
fi

#TODO
check_1_4_9="1.4.9  - Ensure that the flanneld file permissions are set to 644 or more restrictive"
check_1_4_10="1.4.10  - Ensure that the flanneld file ownership is set to root:root"
check_1_4_11="1.4.11  - Ensure that the etcd data directory permissions are set to 700 or more restrictive"
directory=$(get_argument_value 'etcd' '--data-dir')
if [ -d $directory ]; then
  if [ "$(stat -c %a $directory)" -eq 700 ]; then
    pass "$check_1_4_11"
  else
    warn "$check_1_4_11"
    perm=$(stat -c %a $directory)
    warn "     * Wrong permissions for $directory:$perm"
  fi
else
  info "$check_1_4_11"
  info "     * Directory not found"
fi

check_1_4_12="1.4.12  - Ensure that the etcd data directory ownership is set to etcd:etcd"
directory=$(get_argument_value 'etcd' '--data-dir')
if [ -d $directory ]; then
  if [ "$(stat -c %U:%G $directory)" = 'etcd:etcd' ]; then
    pass "$check_1_4_12"
  else
    warn "$check_1_4_12"
    owner=$(stat -c %U:%G $directory)
    warn "     * Wrong ownership for $directory:$owner"
  fi
else
  info "$check_1_4_12"
  info "     * Directory not found"
fi

version=$(get_version)
if [ $version -eq 18 ]; then
    check_1_4_13="1.4.13  - Ensure that the admin.conf file permissions are set to 644 or more restrictive"
    file="/etc/kubernetes/admin.conf"
    if [ -f $file ]; then
      if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
        pass "$check_1_4_13"
      else
        warn "$check_1_4_13"
        perm=$(stat -c %a $file)
        warn "     * Wrong permissions for $file:$perm"
      fi
    else
      info "$check_1_4_13"
      info "     * File not found"
    fi

    check_1_4_14="1.4.14  - Ensure that the admin.conf file ownership is set to root:root"
    file="/etc/kubernetes/admin.conf"
    if [ -f $file ]; then
      if [ "$(stat -c %u%g $file)" -eq 00 ]; then
        pass "$check_1_4_14"
      else
        warn "$check_1_4_14"
        owner=$(stat -c %U:%G $file)
        warn "     * Wrong ownership for $file:$owner"
      fi
    else
      info "$check_1_4_14"
      info "     * File not found"
    fi

    check_1_4_15="1.4.15  - Ensure that the scheduler.conf file permissions are set to 644 or more restrictive"
    file="/etc/kubernetes/scheduler.conf"
    if [ -f $file ]; then
      if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
        pass "$check_1_4_15"
      else
        warn "$check_1_4_15"
        perm=$(stat -c %a $file)
        warn "     * Wrong permissions for $file:$perm"
      fi
    else
      info "$check_1_4_15"
      info "     * File not found"
    fi

    check_1_4_16="1.4.16  - Ensure that the scheduler.conf file ownership is set to root:root"
    file="/etc/kubernetes/scheduler.conf"
    if [ -f $file ]; then
      if [ "$(stat -c %u%g $file)" -eq 00 ]; then
        pass "$check_1_4_16"
      else
        warn "$check_1_4_16"
        owner=$(stat -c %U:%G $file)
        warn "     * Wrong ownership for $file:$owner"
      fi
    else
      info "$check_1_4_16"
      info "     * File not found"
    fi

    check_1_4_17="1.4.17  - Ensure that the controller-manager.conf file permissions are set to 644 or more restrictive"
    file="/etc/kubernetes/controller-manager.conf"
    if [ -f $file ]; then
      if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
        pass "$check_1_4_17"
      else
        warn "$check_1_4_17"
        perm=$(stat -c %a $file)
        warn "     * Wrong permissions for $file:$perm"
      fi
    else
      info "$check_1_4_17"
      info "     * File not found"
    fi

    check_1_4_18="1.4.18  - Ensure that the controller-manager.conf file ownership is set to root:root"
    file="/etc/kubernetes/controller-manager.conf"
    if [ -f $file ]; then
      if [ "$(stat -c %u%g $file)" -eq 00 ]; then
        pass "$check_1_4_18"
      else
        warn "$check_1_4_18"
        owner=$(stat -c %U:%G $file)
        warn "     * Wrong ownership for $file:$owner"
      fi
    else
      info "$check_1_4_18"
      info "     * File not found"
    fi
fi

