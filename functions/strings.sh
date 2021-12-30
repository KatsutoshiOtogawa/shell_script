#!/bin/bash
#
# Comment, .env, file utils

#######################################
# Delete some line in bash style comment # started.
# Globals:
#   None
# Arguments:
#   Stdout to delete comment ,a path. this param 
# Outputs:
#   Writes not stared bash style comment # line to stdout
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   cat file | eraze_comment_line
#   eraze_comment_line file
#######################################
function eraze_comment_line {
  # set gnu alias.
  if [ -z $GNU_ALIAS ]; then
    if ! gnu_alias; then
      return 1;
    fi
    # unalias gnu command
    trap '
      gnu_unalias
      trap - RETURN
    ' RETURN
  fi
  local filepath=$1
  # if you ,use pipe line value.
  if [ -z $filepath ]; then
      filepath=-
  fi

  cat $filepath | sed 's/# .*$//'
}

#######################################
# Delete some line in bash style comment # started.
# Globals:
#   None
# Arguments:
#   Stdout to delete comment ,a path. this param 
# Outputs:
#   export VARIABLE_NAME=VARIABLE list
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   cat file | convert_export_line
#   convert_export_line file
#######################################
function convert_export_line {
  # set gnu alias.
  if [ -z $GNU_ALIAS ]; then
    if ! gnu_alias; then
      return 1;
    fi
    # unalias gnu command
    trap '
      gnu_unalias
      trap - RETURN
    ' RETURN
  fi

  local filepath=$1
  # if you ,use pipe line value.
  if [ -z $filepath ]; then
      filepath=-
  fi
  # eraze_comment_line | xargs -I {} echo export {}
  eraze_comment_line $filepath | xargs -I {} echo export {}
}

#######################################
# load .env file. set your environment variable.
# Globals:
#   None
# Arguments:
#   load csv file ,a path.
# Outputs:
#   None
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   load_env .env
#######################################
function load_env {

  local filepath=$1
  # if you ,use pipe line value.
  if [ -z $filepath ]; then
      echo 'you send parameter.' >&2
      return 1
  fi
  # eval "$(cat $1 | sed 's/# .*$//' | xargs -I {} echo export {};)"
  eval "$(cat $filepath | convert_export_line;)"
}

#######################################
# convert text to windows utf8BOM
# Globals:
#   None
# Arguments:
#   filepath
# Outputs:
#   None
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   convert_text_windows_style windows_style.csv
#######################################
function convert_text_windows_style {
  local filepath=$1
  # check nkf command is exists
  if ! type "nkf" > /dev/null; then
      echo "nkf is not exists." >&2
      return 1
  fi
  # if $filepath not exists, return function.
  if [ -z $filepath ]; then
      echo "${filepath} is not exists." >&2
      return 1
  fi
  # shift_jisと分けれるようにする。
  # change to utf8(BOM) CRLF
  nkf --overwrite --oc=UTF-8-BOM -Lw $filepath
}

#######################################
# cat 
# Globals:
#   None
# Arguments:
#   Stdout to delete comment ,a path. this param 
# Outputs:
#   Writes lines delete file_header.
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   cat filelist | cat_map_convert_text_windows_style
#   cat_map_convert_text_windows_style file1 file2 file3 ...
#######################################
function cat_map_convert_text_windows_style {
  local filelist=$@
  if [ -z $filelist ]; then
      filelist=`cat -`
      #  if filelist 
      if [ -z $filelist ]; then
          return 1
      fi
  fi
  # check file exists
  if file_exists $filelist; then
      return 1
  fi
  
  # map function
  cat_map convert_text_windows_style $filelist
}
