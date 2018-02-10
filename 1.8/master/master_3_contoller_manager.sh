info "1.3 - Controller Manager"

check_1_3_1="1.3.1  - Ensure that the --terminated-pod-gc-threshold argument is set as appropriate"
# Filter out processes like "/bin/tee -a /var/log/kube-controller-manager.log"
# which exist on kops-managed clusters.
if check_argument 'kube-controller-manager(\s|$)' '--terminated-pod-gc-threshold' >/dev/null 2>&1; then
    threshold=$(get_argument_value 'kube-controller-manager(\s|$)' '--terminated-pod-gc-threshold')
    pass "$check_1_3_1"
    pass "       * terminated-pod-gc-threshold: $threshold"
else
    echo "done"
    warn "$check_1_3_1"
fi

check_1_3_2="1.3.2  - Ensure that the --profiling argument is set to false"
if check_argument 'kube-controller-manager(\s|$)' '--profiling=false' >/dev/null 2>&1; then
    pass "$check_1_3_2"
else
    warn "$check_1_3_2"
fi

check_1_3_3="1.3.3  - Ensure that the --use-service-account-credentials argument is set to true"
if check_argument 'kube-controller-manager(\s|$)' '--use-service-account-credentials' >/dev/null 2>&1; then
    pass "$check_1_3_3"
else
    warn "$check_1_3_3"
fi

check_1_3_4="1.3.4  - Ensure that the --service-account-private-key-file argument is set as appropriate"
if check_argument 'kube-controller-manager(\s|$)' '--service-account-private-key-file' >/dev/null 2>&1; then
    keyfile=$(get_argument_value 'kube-controller-manager(\s|$)' '--service-account-private-key-file')
    pass "$check_1_3_4"
    pass "       * service-account-private-key-file: $keyfile"
else
    warn "$check_1_3_4"
fi

check_1_3_5="1.3.5  - Ensure that the --root-ca-file argument is set as appropriate"
if check_argument 'kube-controller-manager(\s|$)' '--root-ca-file' >/dev/null 2>&1; then
    cafile=$(get_argument_value 'kube-controller-manager(\s|$)' '--root-ca-file')
    pass "$check_1_3_5"
    pass "       * root-ca-file: $cafile"
else
    warn "$check_1_3_5"
fi
