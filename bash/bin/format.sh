#!/bin/bash
#
# gnu command util.

function create_cal() {
  # set gnu alias.
  if ! source $(which gnu_alias); then
    return 1;
  fi
  date +'%Y-%m-%d %H:%M:%S'
}

function create_date {
  # set gnu alias.
  if ! source $(which gnu_alias); then
    return 1;
  fi
  date -d "30 days" --date '2021-12-29T11:37:43+0900'
}

#######################################
# add operation log for terminal.
# Globals:
#   WORKLOG_DIR
# Arguments:
#   None
# Outputs:
#   None
# Returns:
#   0 if start script command, non-zero on error.
# Example:
#   type_worklog
#   exit #> save work log between working.
#######################################
function type_worklog() {
  # set gnu alias.
  if ! source $(which gnu_alias); then
    return 1;
  fi
  if [ -z $WORKLOG_DIR ]; then
    echo 'set variable WORKING_DIR!' >&2
    return 1
  fi

  # yyyy-mm-dd.log
  local logfile="$(date +'%Y-%m-%d').log"
  script -a $WORKLOG_DIR/$logfile -q
}

