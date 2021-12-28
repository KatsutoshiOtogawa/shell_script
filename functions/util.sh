#!/bin/bash
#
# utils, often use.

#######################################
# write stderr syntax. google style(https://google.github.io/styleguide/shellguide.html)
# Globals:
#   None
# Arguments:
#   All.
# Outputs:
#   None
# Returns:
#   0 if thing was set alias, non-zero on error.
# Example:
#   err "Unable to do_something"  # => you use use sed
#######################################
function err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

#######################################
# Delete file_header for bash_script. shebang and below 2 line
# Globals:
#   None
# Arguments:
#   Stdout to delete comment ,a path. this param 
# Outputs:
#   Writes lines delete file_header.
# Returns:
#   0 if thing was deleted, non-zero on error.
# Example:
#   cat file | delete_file_header
#   delete_file_header file
#######################################
function delete_file_header {
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

  # 最初の二行飛ばす。
  cat $filepath | sed '1,2d'
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
#   cat file | delete_file_header
#   delete_file_header file
#######################################
function cat_map_delete_file_header {
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
  local filelist=$@
  if [ -z $filelist ]; then
    filelist=`cat -`
  fi
  # check file exists
  if file_exists $filelist; then
    return 1
  fi
  # map function
  cat_map delete_file_header $filelist
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
#   cat file_list | cat_map # file_list 
#   cat_map function file1 file2 ...
#######################################
function cat_map {
  local mapF=$1
  local filelist=${@:2:($#-1)}
  # if not exists function cause error.
  if [ -z $1 ]; then
    echo 'pass function name.' >&2
    return 1
  fi
  # check exists function
  if ! type -t $mapF | grep "function" > /dev/null; then
    echo "${mapF} does not exists." >&2
    return 1
  fi

  # if you ,use pipe line value.
  if [ -z $filelist ]; then
    filelist=`cat -`
  fi
  # check file exists
  if file_exists $filelist; then
    return 1
  fi

  for filepath in $filelist; do
    # execute function
    $mapF $filepath
  done
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
#   cat file | delete_file_header
#   delete_file_header file
#######################################
function file_exists {

  for filepath in $@; do
    if ! [ -e $filepath ]; then
      echo "${filepath} is not exists." >&2
      return 1
    fi
  done
}
