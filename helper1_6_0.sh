#!/bin/sh

level2="1.3.6, 2.7, 3.1.1, 3.2.2, 4.2.9, 5.2.9, 5.3.2, 5.4.2, 5.5.1, 5.7.2, 5.7.3, 5.7.4"
not_scored="1.1.9, 1.1.10, 1.1.20, 1.1.21, 1.2.1, 1.2.10, 1.2.12, 1.2.13, 1.2.33, 1.2.34, 1.2.35, 1.3.1, 2.7, 3.1.1, 3.2.2, 4,2.8, 4.2.9, 4.2.13, 5.1.1, 5.1.2, 5.1.3, 5.1.4, 5.1.6, 5.2.1, 5.2.6, 5.2.7, 5.2.8, 5.2.9, 5.3.1, 5.4.1, 5.4.2, 5.5.1, 5.7.1, 5.7.2, 5.7.3"
assessment_manual="1.1.9, 1.1.10, 1.1.20, 1.1.21, 1.2.1, 1.2.10, 1.2.12, 1.2.13, 1.2.33, 1.2.34, 1.2.35, 1.3.1, 2.7, 3.1.1, 3.2.1, 3.2.2, 4.1.3, 4.1.4, 4.1.6, 4.1.7, 4.1.8, 4.2.4, 4.2.5, 4.2.8, 4.2.9, 4.2.10, 4.2.11, 4.2.12, 4.2.13, 5.1.1, 5.1.2, 5.1.3, 5.1.4, 5.1.5, 5.1.6, 5.2.1, 5.2.2, 5.2.3, 5.2.4, 5.2.5, 5.2.6, 5.2.7, 5.2.8, 5.2.9, 5.3.1, 5.3.2, 5.4.1, 5.4.2, 5.5.1, 5.7.1, 5.7.2, 5.7.3, 5.7.4"

info () {

  s_txt=""
  if echo "$1" | grep -q "(Automated)"; then
    s_txt="${bldcyn}[Automated]${txtrst}"
  elif echo "$1" | grep -q "(Manual)"; then
    s_txt="${bldcyn}[Manual]${txtrst}"
  fi

  level_info=""
  scoring_info=""
  if [ ${#s_txt} -ne 0 ]; then
    idx=$(echo "$1" | cut -d " " -f 1)
    if echo "$level2" | grep -q "\<${idx}\>"; then
      level_info="${bldgry}[Level 2]${txtrst}"
    else
      level_info="${bldgry}[Level 1]${txtrst}"
    fi
    if echo "$not_scored" | grep -q "\<${idx}\>"; then
      scoring_info="${bldgry}[Not Scored]${txtrst}"
    else
      scoring_info="${bldgry}[Scored]${txtrst}"
    fi
  fi

  printf "%b\n" "${bldblu}[INFO]${txtrst}${level_info}${s_txt}${scoring_info} $1"
}

pass () {

  s_txt=""
  if echo "$1" | grep -q "(Automated)"; then
    s_txt="${bldcyn}[Automated]${txtrst}"
  elif echo "$1" | grep -q "(Manual)"; then
    s_txt="${bldcyn}[Manual]${txtrst}"
  fi

  level_info=""
  scoring_info=""
  if [ ${#s_txt} -ne 0 ]; then
    idx=$(echo "$1" | cut -d " " -f 1)
    if echo "$level2" | grep -q "\<${idx}\>"; then
      level_info="${bldgry}[Level 2]${txtrst}"
    else
      level_info="${bldgry}[Level 1]${txtrst}"
    fi
    if echo "$not_scored" | grep -q "\<${idx}\>"; then
      scoring_info="${bldgry}[Not Scored]${txtrst}"
    else
      scoring_info="${bldgry}[Scored]${txtrst}"
    fi
  fi

  printf "%b\n" "${bldgrn}[PASS]${txtrst}${level_info}${s_txt}${scoring_info} $1"

}

warn () {
  s_txt=""
  if echo "$1" | grep -q "(Automated)"; then
    s_txt="${bldcyn}[Automated]${txtrst}"
  elif echo "$1" | grep -q "(Manual)"; then
    s_txt="${bldcyn}[Manual]${txtrst}"
  fi

  level_info=""
  scoring_info=""
  if [ ${#s_txt} -ne 0 ]; then
    idx=$(echo "$1" | cut -d " " -f 1)
    if echo "$level2" | grep -q "\<${idx}\>"; then
      level_info="${bldgry}[Level 2]${txtrst}"
    else
      level_info="${bldgry}[Level 1]${txtrst}"
    fi
    if echo "$not_scored" | grep -q "\<${idx}\>"; then
      scoring_info="${bldgry}[Not Scored]${txtrst}"
    else
      scoring_info="${bldgry}[Scored]${txtrst}"
    fi
  fi

  printf "%b\n" "${bldred}[WARN]${txtrst}${level_info}${s_txt}${scoring_info} $1"

}

yell "# ------------------------------------------------------------------------------
# Kubernetes CIS benchmark
#
# NeuVector, Inc. (c) 2020-
#
# NeuVector delivers an application and network intelligent container security
# solution that automatically adapts to protect running containers. Don’t let
# security concerns slow down your CI/CD processes.
# ------------------------------------------------------------------------------"
