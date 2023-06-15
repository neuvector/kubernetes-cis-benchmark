#!/bin/sh

check_title="Ensure that the API Server only makes use of Strong Cryptographic Ciphers (Manual)"
check="$check_number  - $check_title"

if check_argument "$CIS_APISERVER_CMD" '--tls-cipher-suites' >/dev/null 2>&1; then
    ciphers=$(get_argument_value "$CIS_APISERVER_CMD" '--tls-cipher-suites'|cut -d " " -f 1)
    found=$(echo $ciphers| sed -rn '/(TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256|TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256|TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305|TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384|TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305|TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384)/p')
    if [ ! -z "$found" ]; then
      pass "$check"
    else
      warn "$check"
    fi
else
    warn "$check"
fi
