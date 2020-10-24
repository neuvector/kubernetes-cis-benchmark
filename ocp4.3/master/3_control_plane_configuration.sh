info "3 - Control Plane Configuration"

info "3.1 - Authentication and Authorization"

#todo review
check_3_1_1="3.1.1  - Client certificate authentication should not be used for users (Not Scored)"
output=$(find /etc/kubernetes/static-pod-resources -type f -wholename '*configmaps/client-ca/ca-bundle.crt')
if [ -z "$output" ]; then
  warn "$check_3_1_1"
else
  pass "check_3_1_1"
fi

info "3.2 - Logging"

check_3_2_1="3.2.1 - Ensure that a minimal audit policy is created (Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.auditConfig.auditFilePath','.auditConfig.enabled','.auditConfig.logFormat','.auditConfig.maximumFileSizeMegabytes','.auditConfig.maximumRetainedFiles')
if [ -z "$output" ]; then
  warn "$check_3_2_1"
else
  pass "$check_3_2_1"
fi

check_3_2_2="3.2.2 - Ensure that the audit policy covers key security concerns (Not Scored)"
output=$(oc --kubeconfig "$KUBE_CONFIG_PATH" get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.auditConfig.auditFilePath','.auditConfig.enabled','.auditConfig.logFormat','.auditConfig.maximumFileSizeMegabytes','.auditConfig.maximumRetainedFiles','.auditConfig.policyConfiguration')
if [ -z "$output" ]; then
  warn "$check_3_2_2"
else
  pass "$check_3_2_2"
fi
