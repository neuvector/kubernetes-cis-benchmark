info "2 - etcd"
check_number="2.1" . ./checks/etcd/cert-file_and_key-file_are_set.sh
check_number="2.2" . ./checks/etcd/client-cert-auth_is_set_to_true.sh
check_number="2.3" . ./checks/etcd/auto-tls_is_not_set_to_true.sh
check_number="2.4" . ./checks/etcd/peer-cert-file_and_peer-key-file_are_set.sh
check_number="2.5" . ./checks/etcd/peer-client-cert-auth_is_set_to_true.sh
check_number="2.6" . ./checks/etcd/peer-auto-tls_is_not_set_to_true.sh
check_number="2.7" . ./checks/etcd/unique_Certificate_Authority_is_used.sh
