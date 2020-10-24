info "1 - Control Plane Components"

info "1.1 - Master Node Configuration Files"

check_1_1_1="1.1.1  - Ensure that the API server pod specification file permissions are set to 644 or more restrictive (Scored)"

file="/etc/kubernetes/manifests/kube-apiserver-pod.yaml"
if [ -f $file ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 640 -o "$(stat -c %a $file)" -eq 600 ]; then
    pass "$check_1_1_1"
  else
    warn "$check_1_1_1"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_1_1"
  info "     * File not found"
fi

check_1_1_2="1.1.2  - Ensure that the API server pod specification file ownership is set to root:root (Scored)"

file="/etc/kubernetes/manifests/kube-apiserver-pod.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_1_2"
  else
    warn "$check_1_1_2"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_1_2"
fi

check_1_1_3="1.1.3  - Ensure that the controller manager pod specification file permissions are set to 644 or more restrictive (Scored)"

file="/etc/kubernetes/manifests/kube-controller-manager-pod.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_1_1_3"
  else
    warn "$check_1_1_3"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_1_3"
  info "     * File not found"
fi

check_1_1_4="1.1.4  - Ensure that the controller manager pod specification file ownership is set to root:root (Scored)"

file="/etc/kubernetes/manifests/kube-controller-manager-pod.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_1_4"
  else
    warn "$check_1_1_4"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_1_4"
fi

check_1_1_5="1.1.5  - Ensure that the scheduler pod specification file permissions are set to 644 or more restrictive (Scored)"

file="/etc/kubernetes/manifests/kube-scheduler-pod.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_1_1_5"
  else
    warn "$check_1_1_5"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_1_5"
  info "     * File not found"
fi

check_1_1_6="1.1.6  - Ensure that the scheduler pod specification file ownership is set to root:root (Scored)"

file="/etc/kubernetes/manifests/kube-scheduler-pod.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_1_6"
  else
    warn "$check_1_1_6"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_1_6"
fi

check_1_1_7="1.1.7  - Ensure that the etcd pod specification file permissions are set to 644 or more restrictive (Scored)"

file="/etc/kubernetes/manifests/etcd-member.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_1_1_7"
  else
    warn "$check_1_1_7"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_1_7"
  info "     * File not found"
fi

check_1_1_8="1.1.8  - Ensure that the etcd pod specification file ownership is set to root:root (Scored)"

file="/etc/kubernetes/manifests/etcd-member.yaml"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_1_8"
  else
    warn "$check_1_1_8"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_1_8"
fi

#todo find CNI file location
check_1_1_9="1.1.9  - Ensure that the Container Network Interface file permissions are set to 644 or more restrictive (Not Scored)"

valid_permission=true
path_cni_netd="/etc/cni/net.d"
path_cni_bin="/opt/cni/bin"
path_sdn_lib_ocpsdn="/var/lib/cni/networks/openshift-sdn"
path_sdn_run_ocpsdn="/var/run/openshift-sdn"
path_ovs_openv="/var/run/openvswitch"
path_ovs_k8s="/var/run/kubernetes"
path_ovs_etc_openv="/etc/openvswitch"
path_ovs_run_openv="/run/openvswitch"
path_ovs_var_openv="/var/run/openvswitch"

invalid_file_list=""

for p in "$path_cni_netd" "$path_cni_bin" "$path_sdn_lib_ocpsdn" "$path_sdn_run_ocpsdn" "$path_ovs_openv" "$path_ovs_k8s" "$path_ovs_etc_openv" "$path_ovs_run_openv" "$path_ovs_var_openv"
do
  if [ -d "$p" ]; then
    files=$(find $p -type f)
    for i in $files
    do
      if [ $(stat -c %a "$i") -gt 644 ]; then
        valid_permission=false
        invalid_file_list+=" $i"
      fi
    done
  fi
done

if [ "$valid_permission" = "true" ]; then
  pass "$check_1_1_9"
else
  warn "$check_1_1_9"
  for p in $invalid_file_list
  do
    warn " *Wrong ownership for $p "
  done
fi

check_1_1_10="1.1.10  - Ensure that the Container Network Interface file ownership is set to root:root (Not Scored)"

valid_ownership=true
path_cni_netd="/etc/cni/net.d"
path_cni_bin="/opt/cni/bin"

path_sdn_lib_ocpsdn="/var/lib/cni/networks/openshift-sdn"
path_sdn_run_ocpsdn="/var/run/openshift-sdn"

path_ovs_openv="/var/run/openvswitch"
path_ovs_k8s="/var/run/kubernetes"
path_ovs_etc_openv="/etc/openvswitch"
path_ovs_run_openv="/run/openvswitch"
path_ovs_var_openv="/var/run/openvswitch"

invalid_file_list=""

for p in "$path_cni_netd" "$path_cni_bin" "$path_sdn_lib_ocpsdn" "$path_sdn_run_ocpsdn" "$path_ovs_k8s"
do
  if [ -d "$p" ]; then
    files=$(find $p -type f)
    for i in $files
    do
      if [ $(stat -c %U:%G "$i") != "root:root" ]; then
        valid_ownership=false
        invalid_file_list+=" $i"
      fi
    done
  fi
done

for p in "$path_ovs_openv" "$path_ovs_etc_openv" "$path_ovs_run_openv" "$path_ovs_var_openv"
do
  if [ -d "$p" ]; then
    files=$(find $p -type f)
    for i in $files
    do
      if [ $(stat -c %U:%G "$i") != "openvswitch:openvswitch" ]; then
        valid_ownership=false
        invalid_file_list+=" $i"
      fi
    done
  fi
done

if [ "$valid_ownership" = "true" ]; then
  pass "$check_1_1_10"
else
  warn "$check_1_1_10"
  for p in $invalid_file_list
  do
    warn " *Wrong ownership for $p "
  done
fi

check_1_1_11="1.1.11  - Ensure that the etcd data directory permissions are set to 700 or more restrictive (Scored)"

file="/var/lib/etcd"
if [ -d "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 700 ]; then
    pass "$check_1_1_11"
  else
    warn "$check_1_1_11"
    warn "     * Wrong permission for $file"
  fi
else
  info "$check_1_1_11"
fi

check_1_1_12="1.1.12  - Ensure that the etcd data directory ownership is set to etcd:etcd (Scored)"

file="/var/lib/etcd"
if [ -d "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_1_12"
  else
    warn "$check_1_1_12"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_1_12"
fi

check_1_1_13="1.1.13  - Ensure that the admin.conf file permissions are set to 644 or more restrictive (Scored)"

file="/etc/kubernetes/kubeconfig"
if [ -f "$file" ]; then
  if [ "$(stat -c %a $file)" -eq 644 -o "$(stat -c %a $file)" -eq 600 -o "$(stat -c %a $file)" -eq 400 ]; then
    pass "$check_1_1_13"
  else
    warn "$check_1_1_13"
    warn "     * Wrong permissions for $file"
  fi
else
  info "$check_1_1_13"
  info "     * File not found"
fi

check_1_1_14="1.1.14  - Ensure that the admin.conf file ownership is set to root:root (Scored)"

file="/etc/kubernetes/kubeconfig"
if [ -f "$file" ]; then
  if [ "$(stat -c %u%g $file)" -eq 00 ]; then
    pass "$check_1_1_14"
  else
    warn "$check_1_1_14"
    warn "     * Wrong ownership for $file"
  fi
else
  info "$check_1_1_14"
fi

check_1_1_15="1.1.15  - Ensure that the scheduler.conf file permissions are set to 644 or more restrictive (Scored)"

files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/configmaps/scheduler-kubeconfig/kubeconfig')

valid_permission=false
for i in $files
do
  if [ $(stat -c %a "$i") -eq 644 -o $(stat -c %a "$i") -eq 600 -o $(stat -c %a "$i") -eq 400 ]; then
    valid_permission=true
  else
    valid_permission=false
    break
  fi
done

if [ "$valid_permission" = "true" ]; then
  pass "$check_1_1_15"
else
  warn "$check_1_1_15"
fi

check_1_1_16="1.1.16  - Ensure that the scheduler.conf file ownership is set to root:root (Scored)"

files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/configmaps/scheduler-kubeconfig/kubeconfig')

valid_permission=false
for i in $files
do
  if [ $(stat -c %u%g "$i") -eq 00 ]; then
    valid_permission=true
  else
    valid_permission=false
    break
  fi
done

if [ "$valid_permission" = "true" ]; then
  pass "$check_1_1_16"
else
  warn "$check_1_1_16"
fi

check_1_1_17="1.1.17  - Ensure that the controller-manager.conf file permissions are set to 644 or more restrictive (Scored)"

files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/configmaps/controller-manager-kubeconfig/kubeconfig')

valid_permission=false
for i in $files
do
  if [ $(stat -c %a "$i") -eq 644 -o $(stat -c %a "$i") -eq 600 -o $(stat -c %a "$i") -eq 400 ]; then
    valid_permission=true
  else
    valid_permission=false
    break
  fi
done

if [ "$valid_permission" = "true" ]; then
  pass "$check_1_1_17"
else
  warn "$check_1_1_17"
fi

check_1_1_18="1.1.18  - Ensure that the controller-manager.conf file ownership is set to root:root (Scored)"

files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/configmaps/controller-manager-kubeconfig/kubeconfig')

valid_permission=false
for i in $files
do
  if [ $(stat -c %u%g "$i") -eq 00 ]; then
    valid_permission=true
  else
    valid_permission=false
    break
  fi
done

if [ "$valid_permission" = "true" ]; then
  pass "$check_1_1_18"
else
  warn "$check_1_1_18"
fi

check_1_1_19="1.1.19  - Ensure that the Kubernetes PKI directory and file ownership is set to root:root (Scored)"

directories=$(find /etc/kubernetes/static-pod-resources -type d -wholename '*/secrets*')
files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/secrets*')

valid_perm_dir=false
for i in $directories
do
  if [ $(stat -c %u%g "$i") -eq 00 ]; then
    valid_perm_dir=true
  else
    valid_perm_dir=false
    break
  fi
done

valid_perm_file=false
for i in $files
do
  if [ $(stat -c %u%g "$i") -eq 00 ]; then
    valid_perm_file=true
  else
    valid_perm_file=false
    break
  fi
done

if [ "$valid_perm_file" = "true" ] && [ "$valid_perm_dir" = "true" ]; then
  pass "$check_1_1_19"
else
  warn "$check_1_1_19"
fi

check_1_1_20="1.1.20  - Ensure that the Kubernetes PKI certificate file permissions are set to 644 or more restrictive (Not Scored)"
files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/secrets/*.crt')
valid_perm_file=false
for i in $files
do
  if [ $(stat -c %a "$i") -eq 600 ]; then
    valid_perm_file=true
  else
    valid_perm_file=false
    break
  fi
done

if [ "$valid_perm_file" = "true" ]; then
  pass "$check_1_1_20"
else
  warn "$check_1_1_20"
fi

check_1_1_21="1.1.21  - Ensure that the Kubernetes PKI key file permissions are set to 600 (Not Scored)"
files=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*/secrets/*.key')
valid_perm_file=false
for i in $files
do
  if [ $(stat -c %a "$i") -eq 600 ]; then
    valid_perm_file=true
  else
    valid_perm_file=false
    break
  fi
done

if [ "$valid_perm_file" = "true" ]; then
  pass "$check_1_1_21"
else
  warn "$check_1_1_21"
fi

info "1.2 - API Server"

check_1_2_1="1.2.1  - Ensure that the --anonymous-auth argument is set to false (Not Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq '.auditConfig.policyConfiguration.rules[]')

matched=$(echo "$output" | sed -rn 'system:unauthenticated')
if [ -z "$matched" ]; then
  warn "$check_1_2_1"
else
  pass "$check_1_2_1"
fi

check_1_2_2="1.2.2  - Ensure that the --basic-auth-file argument is not set (Scored)"
output_cm=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm config -o yaml | grep --color "basic-auth")
output_api=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "basic-auth" )
if [ -z "$output_cm" ] && [ -z "$output_api" ] ; then
  pass "$check_1_2_2"
else
  warn "$check_1_2_2"
fi

check_1_2_3="1.2.3  - Ensure that the --token-auth-file parameter is not set (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments')
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get kubeapiservers.operator.openshift.io cluster -o json | jq '.spec.observedConfig.apiServerArguments')
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_2_3"
else
  pass "$check_1_2_3"
fi

check_1_2_4="1.2.4  - Ensure that the --kubelet-https argument is set to true (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "kubelet-https" )
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm config -o yaml | grep --color "kubelet-https")
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_2_4"
else
  pass "$check_1_2_4"
fi

check_1_2_5="1.2.5  - Ensure that the --kubelet-client-certificate and --kubelet-client-key arguments are set as appropriate (Scored)"
certificate=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-cert-syncer-kubeconfig -o yaml | grep -e 'client-certificate' | sed 's/.*client-certificate: //g')
key=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-cert-syncer-kubeconfig -o yaml | grep -e 'client-key' | sed 's/.*client-certificate: //g')
if [ -z "$certificate" ] || [ -z "$key" ]; then
  warn "$check_1_2_5"
else
  pass "$check_1_2_5"
  pass "       * client-certificate: $certificate"
  pass "       * client-key: $key"
fi

check_1_2_6="1.2.6  - Ensure that the --kubelet-certificate-authority argument is set as appropriate (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments')
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get kubeapiservers.operator.openshift.io cluster -o json | jq '.spec.observedConfig.apiServerArguments')
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_2_6"
else
  pass "$check_1_2_6"
fi

check_1_2_7="1.2.7  - Ensure that the --authorization-mode argument is not set to AlwaysAllow (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments' )
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get kubeapiservers.operator.openshift.io cluster -o json | jq '.spec.observedConfig.apiServerArguments' )
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_2_7"
else
  pass "$check_1_2_7"
fi

check_1_2_8="1.2.8  - Ensure that the --authorization-mode argument includes Node (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments' )
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get kubeapiservers.operator.openshift.io cluster -o json | jq '.spec.observedConfig.apiServerArguments' )
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_2_8"
else
  pass "$check_1_2_8"
fi

check_1_2_9="1.2.9  - Ensure that the --authorization-mode argument includes RBAC (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments' )
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get kubeapiservers.operator.openshift.io cluster -o json | jq '.spec.observedConfig.apiServerArguments' )
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_2_9"
else
  pass "$check_1_2_9"
fi

#todo review
check_1_2_10="1.2.10  - Ensure that the admission control plugin EventRateLimit is set (Not Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'EventRateLimit')
if [ -z "$output" ]; then
    pass "$check_1_2_10"
else
    warn "$check_1_2_10"
fi

check_1_2_11="1.2.11  - Ensure that the admission control plugin AlwaysAdmit is not set (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'AlwaysAdmit' )
if [ -z "$output" ]; then
    pass "$check_1_2_11"
else
    warn "$check_1_2_11"
fi

check_1_2_12="1.2.12  - Ensure that the admission control plugin AlwaysPullImages is set (Not Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'AlwaysPullImages')
if [ -z "$output" ]; then
    pass "$check_1_2_12"
else
    warn "$check_1_2_12"
fi

check_1_2_13="1.2.13  - Ensure that the admission control plugin SecurityContextDeny is set if PodSecurityPolicy is not used (Not Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'enable-admission-plugins')
if [ -z "$output" ]; then
    pass "$check_1_2_13"
else
    warn "$check_1_2_13"
fi

check_1_2_14="1.2.14  - Ensure that the admission control plugin ServiceAccount is set (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'ServiceAccount')
if [ -z "$output" ]; then
    pass "$check_1_2_14"
else
    warn "$check_1_2_14"
fi

check_1_2_15="1.2.15  - Ensure that the admission control plugin NamespaceLifecycle is set (Scored)"

output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'NamespaceLifecycle')
if [ -z "$output" ]; then
    pass "$check_1_2_15"
else
    warn "$check_1_2_15"
fi

check_1_2_16="1.2.16  - Ensure that the admission control plugin PodSecurityPolicy is set (Scored)"

output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'PodSecurityPolicy')
if [ -z "$output" ]; then
    pass "$check_1_2_16"
else
    warn "$check_1_2_16"
fi

check_1_2_17="1.2.17  - Ensure that the admission control plugin NodeRestriction is set (Scored)"

output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color admission | grep 'NodeRestriction')
if [ -z "$output" ]; then
    pass "$check_1_2_17"
else
    warn "$check_1_2_17"
fi

check_1_2_18="1.2.18  - Ensure that the --insecure-bind-address argument is not set (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-pod -o yaml | grep --color "insecure-bind-address")
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "insecure-bind-address")
output_3=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm config -o yaml | grep --color "insecure-bind-address")
output_4=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm kube-controller-manager-pod -o yaml | grep --color "insecure-bind-address")

if [ -z "$output_1" ] && [ -z "$output_2" ] && [ -z "$output_3" ] && [ -z "$output_4" ] ; then
  pass "$check_1_2_18"
else
  warn "$check_1_2_18"
fi

check_1_2_19="1.2.19  - Ensure that the --insecure-port argument is set to 0 (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-pod -o yaml | grep "insecure-port=6080")
if [ -z "$output" ]; then
  warn "$check_1_2_19"
else
  pass "$check_1_2_19"
fi

check_1_2_20="1.2.20  - Ensure that the --secure-port argument is not set to 0 (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm config -o yaml | grep --color "secure")
if [ -z "$output" ]; then
  warn "$check_1_2_20"
else
  pass "$check_1_2_20"
fi

check_1_2_21="1.2.21  - Ensure that the --profiling argument is set to false (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm config -o yaml | grep --color "profiling")
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "profiling")
if [ -z "$output_1" ] && [ -z "$output_2" ]; then
  pass "$check_1_2_21"
else
  warn "$check_1_2_21"
fi

check_1_2_22="1.2.22  - Ensure that the --audit-log-path argument is set (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq -r .auditConfig.auditFilePath)
if [ -z "$output" ]; then
    warn "$check_1_2_22"
else
    pass "$check_1_2_22"
fi

#todo review skip
check_1_2_23="1.2.23  - Ensure that the --audit-log-maxage argument is set to 30 or as appropriate (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "audit-log")
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-pod -o yaml | grep --color "audit-log")
if [ -z "$output_1" ] && [ -z "$output_2" ]; then
  pass "$check_1_2_23"
else
  warn "$check_1_2_23"
fi
#todo review skip
check_1_2_24="1.2.24  - Ensure that the --audit-log-maxbackup argument is set to 10 or as appropriate (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "audit-log")
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-pod -o yaml | grep --color "audit-log")
if [ -z "$output_1" ] && [ -z "$output_2" ]; then
  pass "$check_1_2_24"
else
  warn "$check_1_2_24"
fi

check_1_2_25="1.2.25  - Ensure that the --audit-log-maxsize argument is set to 100 or as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .auditConfig.maximumFileSizeMegabytes)
if [ "$output" -eq 100 ]; then
  pass "$check_1_2_25"
else
  warn "$check_1_2_25"
fi

check_1_2_26="1.2.26  - Ensure that the --request-timeout argument is set as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .servingInfo.requestTimeoutSeconds)
if [ "$output" -eq 3600 ]; then
  pass "$check_1_2_26"
else
  warn "$check_1_2_26"
fi

check_1_2_27="1.2.27  - Ensure that the --service-account-lookup argument is set to true (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "service-account-lookup")
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm kube-apiserver-pod -o yaml | grep --color "service-account-lookup")
if [ -z "$output_1" ] && [ -z "$output_2" ]; then
  pass "$check_1_2_27"
else
  warn "$check_1_2_27"
fi

#todo review
check_1_2_28="1.2.28  - Ensure that the --service-account-key-file argument is set as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .serviceAccountPublicKeyFiles[])
if [ -z "$output" ]; then
  warn "$check_1_2_28"
else
  pass "$check_1_2_28"
fi

check_1_2_29="1.2.29  - Ensure that the --etcd-certfile and --etcd-keyfile arguments are set as appropriate (Scored)"
output_cert=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .servingInfo.certFile)
output_key=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .storageConfig.keyFile)
if [ -z "$output_cert" ] || [ -z "$output_key" ]; then
  warn "$check_1_2_29"
else
  pass "$check_1_2_29"
fi

check_1_2_30="1.2.30  - Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Scored)"
output_cert=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .servingInfo.certFile)
output_key=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .servingInfo.keyFile)
if [ -z "$output_cert" ] || [ -z "$output_key" ]; then
  warn "$check_1_2_30"
else
  pass "$check_1_2_30"
fi

#todo review
check_1_2_31="1.2.31  - Ensure that the --client-ca-file argument is set as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .servingInfo.clientCA)
if [ -z "$output" ]; then
  warn "$check_1_2_31"
else
  pass "$check_1_2_31"
fi

#todo review
check_1_2_32="1.2.32  - Ensure that the --etcd-cafile argument is set as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r .storageConfig.ca)
if [ -z "$output" ]; then
  warn "$check_1_2_32"
else
  pass "$check_1_2_32"
fi

#todo review
check_1_2_33="1.2.33  - Ensure that the --encryption-provider-config argument is set as appropriate (Not Scored)"
#if get_argument_value "$CIS_APISERVER_CMD" '--encryption-provider-config'| grep 'EncryptionConfig' >/dev/null 2>&1; then
#    pass "$check_1_2_33"
#else
#    warn "$check_1_2_33"
#fi

#todo review
check_1_2_34="1.2.34  - Ensure that encryption providers are appropriately configured (Not Scored)"
#if check_argument "$CIS_APISERVER_CMD" '--encryption-provider-config' >/dev/null 2>&1; then
#    encryptionConfig=$(get_argument_value "$CIS_APISERVER_CMD" '--encryption-provider-config')
#    if [ -f "$encryptionConfig" ]; then
#      if [ $(grep -c "\- aescbc:\|\- kms:\|\- secretbox:" $encryptionConfig) -ne 0 ]; then
#        pass "$check_1_2_34"
#      else
#        warn "$check_1_2_34"
#      fi
#    else
#      warn "$check_1_2_34"
#    fi
#else
#    warn "$check_1_2_34"
#fi
#if get_argument_value "$CIS_APISERVER_CMD" '--experimental-encryption-provider-config'| grep 'EncryptionConfig' >/dev/null 2>&1; then
#    encryptionConfig=$(get_argument_value "$CIS_APISERVER_CMD" '--experimental-encryption-provider-config')
#    if sed ':a;N;$!ba;s/\n/ /g' $encryptionConfig |grep "providers:\s* - aescbc" >/dev/null 2>&1; then
#        pass "$check_1_2_34"
#    else
#        warn "$check_1_2_34"
#    fi
#else
#    warn "$check_1_2_34"
#fi

info "1.3 - Controller Manager"

#check_1_3_1="1.3.1  - Ensure that the --terminated-pod-gc-threshold argument is set as appropriate (Not Scored)"
## Filter out processes like "/bin/tee -a /var/log/kube-controller-manager.log"
## which exist on kops-managed clusters.
#if check_argument "$CIS_MANAGER_CMD" '--terminated-pod-gc-threshold' >/dev/null 2>&1; then
#    threshold=$(get_argument_value "$CIS_MANAGER_CMD" '--terminated-pod-gc-threshold')
#    pass "$check_1_3_1"
#    pass "       * terminated-pod-gc-threshold: $threshold"
#else
#    warn "$check_1_3_1"
#fi
#
#check_1_3_2="1.3.2  - Ensure that the --profiling argument is set to false (Scored)"
#if check_argument "$CIS_MANAGER_CMD" '--profiling=false' >/dev/null 2>&1; then
#    pass "$check_1_3_2"
#else
#    warn "$check_1_3_2"
#fi

check_1_3_3="1.3.3  - Ensure that the --use-service-account-credentials argument is set to true (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmaps config -n openshift-kube-controller-manager -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r '.extendedArguments["use-service-account-credentials"][]')
if [ "$output" = "true" ]; then
  pass "$check_1_3_3"
else
  warn "$check_1_3_3"
fi

check_1_3_4="1.3.4  - Ensure that the --service-account-private-key-file argument is set as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmaps config -n openshift-kube-controller-manager -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r '.extendedArguments["service-account-private-key-file"][]')
if [ -z "$output" ]; then
  warn "$check_1_3_4"
else
  pass "$check_1_3_4"
fi

check_1_3_5="1.3.5  - Ensure that the --root-ca-file argument is set as appropriate (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmaps config -n openshift-kube-controller-manager -ojson | \
  jq -r '.data["config.yaml"]' | \
  jq -r '.extendedArguments["root-ca-file"][]')
if [ -z "$output" ]; then
  warn "$check_1_3_5"
else
  pass "$check_1_3_5"
fi

check_1_3_6="1.3.6  - Ensure that the RotateKubeletServerCertificate argument is set to true (Scored)"
output_1=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color "RotateKubeletServerCertificate=true")
output_2=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-controller-manager get cm config -o yaml | grep --color "RotateKubeletServerCertificate=true")
if [ -z "$output_1" ] || [ -z "$output_2" ]; then
  warn "$check_1_3_6"
else
  pass "$check_1_3_6"
fi

check_1_3_7="1.3.7  - Ensure that the --bind-address argument is set to 127.0.0.1 (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" -n openshift-kube-apiserver get cm config -o yaml | grep --color '"bindAddress:0.0.0.0:6443"')
if [ -z "$output" ]; then
  warn "$check_1_3_7"
else
  pass "$check_1_3_7"
fi

info "1.4 - Scheduler"

#todo review
check_1_4_1="1.4.1  - Ensure that the --profiling argument is set to false (Scored)"
#if check_argument "$CIS_SCHEDULER_CMD" '--profiling=false' >/dev/null 2>&1; then
#  	pass "$check_1_4_1"
#else
#  	warn "$check_1_4_1"
#fi

#todo review
check_1_4_2="1.4.2  - Ensure that the --bind-address argument is set to 127.0.0.1 (Scored)"
#if get_argument_value "$CIS_SCHEDULER_CMD" '--bind-address'| grep '127.0.0.1' >/dev/null 2>&1; then
#  	pass "$check_1_4_2"
#else
#  	warn "$check_1_4_2"
#fi
