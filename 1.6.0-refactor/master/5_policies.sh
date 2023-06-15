info "5 - Policies"

info "5.1 - RBAC and Service Accounts"
check_number="5.1.1" . ./checks/policies/rbac_and_service_accounts/cluster-admin_role_is_only_used_where_required.sh
check_number="5.1.2" . ./checks/policies/rbac_and_service_accounts/minimize_access_to_secrets.sh
check_number="5.1.3" . ./checks/policies/rbac_and_service_accounts/minimize_wildcard_use_in_Roles_and_ClusterRoles.sh 
check_number="5.1.4" . ./checks/policies/rbac_and_service_accounts/minimize_access_to_create_pods.sh
check_number="5.1.5" . ./checks/policies/rbac_and_service_accounts/default_service_accounts_are_not_actively_used.sh
check_number="5.1.6" . ./checks/policies/rbac_and_service_accounts/service_account_tokens_are_only_mounted_where_necessary.sh

info "5.2 - Pod Security Policies"
check_number="5.2.1" . ./checks/policies/pod_security_policies/minimize_admission_of_privileged_containers.sh
check_number="5.2.2" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_wishing_to_share_the_host_process_ID_namespace.sh
check_number="5.2.3" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_wishing_to_share_the_host_IPC_namespace.sh
check_number="5.2.4" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_wishing_to_share_the_host_network_namespace.sh
check_number="5.2.5" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_with_allowPrivilegeEscalation.sh
check_number="5.2.6" . ./checks/policies/pod_security_policies/minimize_admission_of_root_containers.sh
check_number="5.2.7" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_with_the_NET_RAW_capability.sh
check_number="5.2.8" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_with_added_capabilities.sh
check_number="5.2.9" . ./checks/policies/pod_security_policies/minimize_admission_of_containers_with_capabilities_assigned.sh

info "5.3 - Network Policies and CNI"
check_number="5.3.1" . ./checks/policies/network_policies_and_cni/CNI_in_use_supports_NetworkPolicies.sh
check_number="5.3.2" . ./checks/policies/network_policies_and_cni/all_namespaces_have_NetworkPolicies.sh

info "5.4 - Secrets Management"
check_number="5.4.1" . ./checks/policies/secrets_management/prefer_using_secrets_as_files_over_environment_variables.sh
check_number="5.4.2" . ./checks/policies/secrets_management/consider_external_secret_storage.sh

info "5.5 - Extensible Admission Control"
check_number="5.5.1" . ./checks/policies/extensible_admission_control/configure_image_provenance_using_ImagePolicyWebhook_admission_controller.sh

info "5.7 - General Policies"
check_number="5.7.1" . ./checks/policies/general_policies/create_administrative_boundaries_between_resources_using_namespaces.sh
#todo remediation
check_number="5.7.2" . ./checks/policies/general_policies/seccomp_profile_is_set_to_docker_default_in_your_pod_definitions.sh
check_number="5.7.3" . ./checks/policies/general_policies/apply_security_context_to_your_pods_and_containers.sh
check_number="5.7.4" . ./checks/policies/general_policies/the_default_namespace_should_not_be_used.sh
