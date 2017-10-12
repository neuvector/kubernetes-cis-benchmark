#!/bin/sh
# ------------------------------------------------------------------------------
# Kubenetes CIS benchmark
#
# Neuvector, Inc. (c) 2016-
#
# NeuVector delivers an application and network intelligent container security 
# solution that automatically adapts to protect running containers. Don’t let 
# security concerns slow down your CI/CD processes.
# ------------------------------------------------------------------------------

# Load dependencies
. ./helper.sh

ver=$1
if [ -z "$1" ]; then
    warn "usage: ./federation.sh version"
	exit
fi
# Check for required program(s)
req_progs='awk grep pgrep sed'
for p in $req_progs; do
  command -v "$p" >/dev/null 2>&1 || { printf "%s command not found.\n" "$p"; exit 1; }
done

# Load all the tests from tests/ and run them
main () {
  info "3 - Federated Deployments"

  for test in $ver/federation/federation_*.sh
  do
     . ./"$test"
  done
}

main "$@"

