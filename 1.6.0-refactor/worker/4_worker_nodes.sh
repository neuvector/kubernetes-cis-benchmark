#!/bin/sh

info "4.1 - Worker Node Configuration Files"
check_number="4.1.1" . ./checks/worker_nodes/configuration_files/kubelet_service_file_permissions.sh
check_number="4.1.2" . ./checks/worker_nodes/configuration_files/kubelet_service_file_ownership.sh
check_number="4.1.3" . ./checks/worker_nodes/configuration_files/proxy_kubeconfig_file_permissions.sh
check_number="4.1.4" . ./checks/worker_nodes/configuration_files/proxy_kubeconfig_file_ownership.sh
check_number="4.1.5" . ./checks/worker_nodes/configuration_files/kubelet_conf_file_permissions.sh
check_number="4.1.6" . ./checks/worker_nodes/configuration_files/kubelet_conf_file_ownership.sh
check_number="4.1.7" . ./checks/worker_nodes/configuration_files/certificate_authorities_file_permissions.sh
check_number="4.1.8" . ./checks/worker_nodes/configuration_files/client_certificate_authorities_file_ownership.sh
check_number="4.1.9" . ./checks/worker_nodes/configuration_files/kubelet_configuration_file_permissions.sh
check_number="4.1.10" . ./checks/worker_nodes/configuration_files/kubelet_configuration_file_ownership.sh

info "4.2 - Kubelet"
# todo review all audits
check_number="4.2.1" . ./checks/worker_nodes/kubelet/anonymous-auth_is_set_to_false.sh
check_number="4.2.2" . ./checks/worker_nodes/kubelet/authorization-mode_is_not_set_to_AlwaysAllow.sh
check_number="4.2.3" . ./checks/worker_nodes/kubelet/client-ca-file_is_set.sh
check_number="4.2.4" . ./checks/worker_nodes/kubelet/read-only-port_is_set_to_0.sh
check_number="4.2.5" . ./checks/worker_nodes/kubelet/streaming-connection-idle-timeout_is_not_set_to_0.sh
check_number="4.2.6" . ./checks/worker_nodes/kubelet/protect-kernel-defaults_is_set_to_true.sh
check_number="4.2.7" . ./checks/worker_nodes/kubelet/make-iptables-util-chains_is_set_to_true.sh
check_number="4.2.8" . ./checks/worker_nodes/kubelet/hostname-override_is_not_set.sh
check_number="4.2.9" . ./checks/worker_nodes/kubelet/event-qps_is_set_to_0_or_appropriate.sh
check_number="4.2.10" . ./checks/worker_nodes/kubelet/tls-cert-file_and_tls-private-key-file_are_set.sh
check_number="4.2.11" . ./checks/worker_nodes/kubelet/rotate-certificates_is_not_set_to_false.sh
check_number="4.2.12" . ./checks/worker_nodes/kubelet/RotateKubeletServerCertificate_is_set_to_true.sh
check_number="4.2.13" . ./checks/worker_nodes/kubelet/kubelet_only_makes_use_of_strong_cryptographic_ciphers.sh
