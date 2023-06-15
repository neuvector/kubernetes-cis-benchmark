info "3 - Control Plane Configuration"

info "3.1 - Authentication and Authorization"
check_number="3.1.1" . ./checks/control_plane_configuration/authn_and_authz/client_certificate_authentication_should_not_be_used_for_users.sh

info "3.2 - Logging"
check_number="3.2.1" . ./checks/control_plane_configuration/logging/a_minimal_audit_policy_is_created.sh
check_number="3.2.2" . ./checks/control_plane_configuration/logging/the_audit_policy_covers_key_security_concerns.sh
