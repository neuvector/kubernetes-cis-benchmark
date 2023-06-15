#!/bin/sh

info () {
  printf "%b\n" "${bldblu}[INFO]${txtrst} $1"
}

pass () {
  printf "%b\n" "${bldgrn}[PASS]${txtrst} $1"
}

warn () {
  printf "%b\n" "${bldred}[WARN]${txtrst} $1"
}

yell "# ------------------------------------------------------------------------------
# Kubernetes CIS benchmark
#
# NeuVector, Inc. (c) 2016-
#
# NeuVector delivers an application and network intelligent container security
# solution that automatically adapts to protect running containers. Don’t let
# security concerns slow down your CI/CD processes.
# ------------------------------------------------------------------------------"


