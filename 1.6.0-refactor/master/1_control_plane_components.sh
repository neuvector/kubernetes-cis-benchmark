info "1 - Control Plane Components"

info "1.1 - Master Node Configuration Files"
check_number="1.1.1" . ./checks/control_plane_components/configuration_files/api-server_pod_spec_file_permissions.sh
check_number="1.1.2" . ./checks/control_plane_components/configuration_files/api-server_pod_spec_file_ownership.sh
check_number="1.1.3" . ./checks/control_plane_components/configuration_files/controller-manager_pod_spec_file_permissions.sh
check_number="1.1.4" . ./checks/control_plane_components/configuration_files/controller-manager_pod_spec_file_ownership.sh
check_number="1.1.5" . ./checks/control_plane_components/configuration_files/scheduler_pod_spec_file_permissions.sh
check_number="1.1.6" . ./checks/control_plane_components/configuration_files/scheduler_pod_spec_file_ownership.sh
check_number="1.1.7" . ./checks/control_plane_components/configuration_files/etcd_pod_spec_file_permissions.sh
check_number="1.1.8" . ./checks/control_plane_components/configuration_files/etcd_pod_spec_file_ownership.sh
check_number="1.1.9" . ./checks/control_plane_components/configuration_files/cni_file_permissions.sh
check_number="1.1.10" . ./checks/control_plane_components/configuration_files/cni_file_ownership.sh
check_number="1.1.11" . ./checks/control_plane_components/configuration_files/etcd_data_dir_permissions.sh
check_number="1.1.12" . ./checks/control_plane_components/configuration_files/etcd_data_dir_ownership.sh
check_number="1.1.13" . ./checks/control_plane_components/configuration_files/admin_conf_file_permissions.sh
check_number="1.1.14" . ./checks/control_plane_components/configuration_files/admin_conf_file_ownership.sh
check_number="1.1.15" . ./checks/control_plane_components/configuration_files/scheduler_conf_file_permissions.sh
check_number="1.1.16" . ./checks/control_plane_components/configuration_files/scheduler_conf_file_ownership.sh
check_number="1.1.17" . ./checks/control_plane_components/configuration_files/controller-manager_conf_file_permissions.sh
check_number="1.1.18" . ./checks/control_plane_components/configuration_files/controller-manager_conf_file_ownership.sh
check_number="1.1.19" . ./checks/control_plane_components/configuration_files/pki_directory_and_files_ownership.sh
check_number="1.1.20" . ./checks/control_plane_components/configuration_files/pki_certs_permissions.sh
check_number="1.1.21" . ./checks/control_plane_components/configuration_files/pki_keys_permissions.sh

info "1.2 - API Server"
check_number="1.2.1" . ./checks/control_plane_components/api-server/anonymous-auth_is_set_to_false.sh
check_number="1.2.2" . ./checks/control_plane_components/api-server/basic-auth-file_is_not_set.sh
check_number="1.2.3" . ./checks/control_plane_components/api-server/token-auth-file_is_not_set.sh
check_number="1.2.4" . ./checks/control_plane_components/api-server/kubelet-https_is_set_to_true.sh
check_number="1.2.5" . ./checks/control_plane_components/api-server/kubelet-client-certificate_and_kubelet-client-key_are_set.sh
check_number="1.2.6" . ./checks/control_plane_components/api-server/kubelet-certificate-authority_is_set.sh
check_number="1.2.7" . ./checks/control_plane_components/api-server/authorization-mode_is_not_set_to_AlwaysAllow.sh
check_number="1.2.8" . ./checks/control_plane_components/api-server/authorization-mode_includes_Node.sh
check_number="1.2.9" . ./checks/control_plane_components/api-server/authorization-mode_includes_RBAC.sh
check_number="1.2.10" . ./checks/control_plane_components/api-server/admission_control_plugin_EventRateLimit_is_set.sh
check_number="1.2.11" . ./checks/control_plane_components/api-server/admission_control_plugin_AlwaysAdmit_is_not_set.sh
check_number="1.2.12" . ./checks/control_plane_components/api-server/admission_control_plugin_AlwaysPullImages_is_set.sh
check_number="1.2.13" . ./checks/control_plane_components/api-server/admission_control_plugin_SecurityContextDeny_is_set_if_PodSecurityPolicy_is_not_used.sh
check_number="1.2.14" . ./checks/control_plane_components/api-server/admission_control_plugin_ServiceAccount_is_set.sh
check_number="1.2.15" . ./checks/control_plane_components/api-server/admission_control_plugin_NamespaceLifecycle_is_set.sh
check_number="1.2.16" . ./checks/control_plane_components/api-server/admission_control_plugin_PodSecurityPolicy_is_set.sh
check_number="1.2.17" . ./checks/control_plane_components/api-server/admission_control_plugin_NodeRestriction_is_set.sh
check_number="1.2.18" . ./checks/control_plane_components/api-server/insecure-bind-address_is_not_set.sh
check_number="1.2.19" . ./checks/control_plane_components/api-server/insecure-port_is_set_to_0.sh
check_number="1.2.20" . ./checks/control_plane_components/api-server/secure-port_is_not_set_to_0.sh
check_number="1.2.21" . ./checks/control_plane_components/api-server/profiling_is_set_to_false.sh
check_number="1.2.22" . ./checks/control_plane_components/api-server/audit-log-path_is_set.sh
check_number="1.2.23" . ./checks/control_plane_components/api-server/audit-log-maxage_is_set_to_30_or_appropriate.sh
check_number="1.2.24" . ./checks/control_plane_components/api-server/audit-log-maxbackup_is_set_to_10_or_appropriate.sh
check_number="1.2.25" . ./checks/control_plane_components/api-server/audit-log-maxsize_is_set_to_100_or_appropriate.sh
check_number="1.2.26" . ./checks/control_plane_components/api-server/request-timeout_is_set.sh
check_number="1.2.27" . ./checks/control_plane_components/api-server/service-account-lookup_is_set_to_true.sh
check_number="1.2.28" . ./checks/control_plane_components/api-server/service-account-key-file_is_set.sh
check_number="1.2.29" . ./checks/control_plane_components/api-server/etcd-certfile_and_etcd-keyfile_is_set.sh
check_number="1.2.30" . ./checks/control_plane_components/api-server/tls-cert-file_and_tls-private-key-file_are_set.sh
check_number="1.2.31" . ./checks/control_plane_components/api-server/client-ca-file_is_set.sh
check_number="1.2.32" . ./checks/control_plane_components/api-server/etcd-cafile_is_set.sh
check_number="1.2.33" . ./checks/control_plane_components/api-server/encryption-provider-config_is_set.sh
check_number="1.2.34" . ./checks/control_plane_components/api-server/encryption_providers_are_appropriately_configured.sh
check_number="1.2.35" . ./checks/control_plane_components/api-server/api-server_only_makes_use_of_strong_cryptographic_ciphers.sh

info "1.3 - Controller Manager"
check_number="1.3.1" . ./checks/control_plane_components/controller-manager/terminated-pod-gc-threshold_is_set.sh
check_number="1.3.2" . ./checks/control_plane_components/controller-manager/profiling_is_set_to_false.sh
check_number="1.3.3" . ./checks/control_plane_components/controller-manager/use-service-account-credentials_is_set_to_true.sh
check_number="1.3.4" . ./checks/control_plane_components/controller-manager/service-account-private-key-file_is_set.sh
check_number="1.3.5" . ./checks/control_plane_components/controller-manager/root-ca-file_is_set.sh
check_number="1.3.6" . ./checks/control_plane_components/controller-manager/RotateKubeletServerCertificate_is_set_to_true.sh
check_number="1.3.7" . ./checks/control_plane_components/controller-manager/bind-address_is_set_to_127_0_0_1.sh

info "1.4 - Scheduler"
check_number="1.4.1" . ./checks/control_plane_components/scheduler/profiling_is_set_to_false.sh
check_number="1.4.2" . ./checks/control_plane_components/scheduler/bind-address_is_set_to_127_0_0_1.sh
