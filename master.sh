#!/bin/sh
# ------------------------------------------------------------------------------
# Kubenetes CIS benchmark
#
# Neuvector, Inc. (c) 2016-
#
# ------------------------------------------------------------------------------

CIS_APISERVER_CMD=${CIS_APISERVER_CMD:-kube-apiserver}
CIS_MANAGER_CMD=${CIS_MANAGER_CMD:-kube-controller-manager}
CIS_SCHEDULER_CMD=${CIS_SCHEDULER_CMD:-kube-scheduler}
CIS_ETCD_CMD=${CIS_ETCD_CMD:-etcd}
CIS_PROXY_CMD=${CIS_PROXY_CMD:-kube-proxy}

# Load dependencies
v_151="1.5.1"
v_141="1.4.1"

case $1 in
  $v_151)
    . ./helper1_5_1.sh
    ;;
  $v_141)
    . ./helper1_4_1.sh
    ;;
  *)
    . ./helper.sh
    ;;
esac

ver=$1
if [ -z "$1" ]; then
  warn "usage: ./master.sh version"
	exit
fi

# Check for required program(s)
req_progs='awk grep pgrep sed kubectl'
for p in $req_progs; do
  command -v "$p" >/dev/null 2>&1 || { printf "%s command not found.\n" "$p"; exit 1; }
done

# Load all the audits from master/ and run them
main () {

  for audit in $ver/master/*.sh
  do
     . ./"$audit"
  done
}

main "$@"
