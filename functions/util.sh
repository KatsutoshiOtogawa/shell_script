#!/bin/bash
#
# utils, often use.

#######################################
# write stderr syntax. google style(https://google.github.io/styleguide/shellguide.html)
# Globals:
#   GNU_ALIAS
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
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

#######################################
# write stdout syntax. google style(https://google.github.io/styleguide/shellguide.html)
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
function out() {
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
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*"
}

function create_cal() {
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
  date +'%Y-%m-%d %H:%M:%S'
}

function create_date {
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
  date -d "30 days" --date '2021-12-29T11:37:43+0900'
}

#######################################
# write stderr syntax. google style(https://google.github.io/styleguide/shellguide.html)
# Globals:
#   BASH_VERSION
# Arguments:
#   None
# Outputs:
#   None
# Returns:
#   0 if correct version bash, non-zero on old version bash you use.
# Example:
#  check_bash_version #=> 1 you use old version bash
#######################################
function check_bash_version {
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
  local min_support=5
  local version=`echo $BASH_VERSION | cut -c -1`

  if [ $version -lt $min_support ]; then
    echo "you use old version bash. use greater ${min_support} version" >&2
    return 1;
  fi
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
  # - filepath
  if [ -z $filepath ]; then
    echo 'select filepath ' >&2
    return 1
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

  local filepath
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
#   cat file | file_exists
#   file_exists file
#######################################
function file_exists {

  # $@がなかったら - を取るというふうに作る必要がある。
  local filepath
  for filepath in $@; do
    if ! [ -e $filepath ]; then
      echo "${filepath} is not exists." >&2
      return 1
    fi
  done
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
  if [ -z $WORKLOG_DIR ]; then
    echo 'set variable WORKING_DIR!' >&2
    return 1
  fi

  # yyyy-mm-dd.log
  local logfile="$(date +'%Y-%m-%d').log"
  script -a $WORKLOG_DIR/$logfile -q
}

#######################################
# check super user.
# Globals:
#   UID
#   EUID
# Arguments:
#   None
# Outputs:
#   None
# Returns:
#   0 if root user, non-zero on non root user.
# Example:
#   is_useruser #=> 0 root user
#######################################
function is_superuser {

  local check=1
  if [ ${UID} = "0" ] || [ ${EUID} = "0" ]; then
    check=0
  fi
  return check
}

#######################################
# select menu items
# Globals:
#   PS3
#   REPLY
# Arguments:
#   PS3 variable
#   after args menu items.
# Outputs:
#   None
# Returns:
#   0 if select exists menu, non-zero on error occured.
# Example:
#   $ select_menu 'your like cooking' hamburger curry sushi
#   1) hamburger
#   2) curry
#   3) sushi
#   your like cooking. Enter 'q' for cancel. > 1
#   $ if "${?}" != 0; then
#   >   echo 'error occured select_menu function.' >&2
#   >   return 1 
#   > fi
#   $ if "${REPLY}" = 'q'; then
#   >   echo 'user cancel' 
#   >   return
#   > fi
#   $ echo $REPLY 
#######################################
function select_menu {
  # check input select message
  if [ -z $1 ]; then
    echo 'input select message!' >&2
    return 1
  fi
  PS3="${1} Enter 'q' for cancel. > "
  # args after two index, assined menu variable.
  local menu=(${@:2:($#-1)})
  if [ -z $menu ]; then
    echo 'set variable for select menu' >&2
    return 1
  fi
  # loop for select menu.
  local item
  select item in "${menu[@]}"
  do
    if [ "${REPLY}" = "q" ]; then
      return
    fi
    # break loop for select existing menu.
    if [ -z $item ]; then
      break
    fi
    echo "invalid selection. choose select menu" >&2
  done
}

#######################################
# check super user.
# Globals:
#   None
# Arguments:
#   alphabet number
# Outputs:
#   alphabet order of alphabet. 0 => a, 25 => z, 26 => aa ...
# Returns:
#   0 if normal end, non-zero on error occured.
# Example:
#   convert2alpha 100 # => dw
#######################################
function convert2alpha {
  local alphabet=($(echo {a..z}))
  local ten_base_num=$1
  
  if [ -z $ten_base_num ]; then
    echo 'assign parameter ten_base_num!' >&2
    return 1
  fi
  # 0 未満の値の時のみエラ-
  if [ $ten_base_num -lt 0 ]; then
    echo '1 greater value' >&2
    return 1
  fi
  
  # 0 -> a
  # 0から始まる数字は8進数と勝手に解釈されるので先頭の0は削除
  # 0は00に直してから、最初の0を削除する。
  twenty_six_base_num=(
    $(echo "obase=26; ibase=10; ${ten_base_num}" | \
      bc | xargs -n 1 | \
      gsed 's/^0$/00/g' | \
      gsed 's/^0//g'
    )
  )
  if [ -n $2 ]; then 
    # 対話形式でないのでswithでやるべき。
    if [ "$2" = "upper" ]; then
      alphabet=($(echo "${alphabet[@]}" | tr "a-z" "A-Z"))
    fi
  fi

  local i
  local str
  for ((i=0; i < ${#twenty_six_base_num[@]}; i++)); do
    local alpha_num="${twenty_six_base_num[${i}]}"
    local digit="${alphabet[$alpha_num]}"
    str="${str}${digit}" 
  done

  echo $str
}

#######################################
# check super user.
# Globals:
#   None
# Arguments:
#   alphabet number
# Outputs:
#   alphabet order of alphabet. 0 => a, 25 => z, 26 => aa ...
# Returns:
#   0 if , non-zero on error occured.
# Example:
#   convert2alpha_list 100 # => 
#######################################
function convert2alpha_list {

  local ten_base_num=$1
  local str
  local i
  for ((i=0;i < ten_base_num;i++)); do
    convert2alpha $i alpha
  done
}

#######################################
# translate text.
# Globals:
#   DEEPL_AUTH_KEY
# Arguments:
#   text
#   lang
# Outputs:
#   alphabet order of alphabet. 0 => a, 25 => z, 26 => aa ...
# Returns:
#   0 if , non-zero on error occured.
# Example:
#   deepl_translate -r story.txt DE => 
#   cat story.txt | deepl_translate -r - DE 
#######################################
function deepl_translate {
  if [ -z $DEEPL_AUTH_KEY ]; then
    echo 'set DEEPL_AUTH_KEY environment variable for translate!' >&2
    return 1
  fi

  if ! which jq > /dev/null; then
    echo 'install jq command. this command is needed to tranalate ' >&2
    return 1
  fi

  local doublequotation
  # -r フラグがあったら左にシフトする事により、同様に処理する。
  if [ $1 = "-r" ]; then
    doublequotation="-r"
    shift
  fi

  # filepath。 -も含む。
  local filepath=$1
  if [ -z $filepath ]; then
    echo 'filepath assingn!' >&2
    return 1
  fi

  # LC_ALL
  local lang=$2
  if [ -z $lang ]; then
    echo 'set lang you want to translate!' >&2
    return 1
  fi

  # api の結果を一時ファイルに書き込む
  local tmpfile=$(mktemp)
  # remove temporary file return function 
  trap "
    rm ${tmpfile}
    trap - RETURN
  " RETURN

  curl https://api-free.deepl.com/v2/translate \
    -d "auth_key=${DEEPL_AUTH_KEY}" \
    -d "source_lang=EN" \
    -d "text=$(cat $filepath)" \
    -d "target_lang=${lang}" > $tmpfile

  # check document(https://www.deepl.com/ja/docs-api/translating-text/response/)
  # 実際にパースしてできなかったらエラーと決め打ち。
  trap "
    cat < ${tmpfile} >&2
    trap - ERR
  " ERR
  jq $doublequotation .translations[].text < $tmpfile

}

function test_environment {

  MYSQL_DB=
}

function production_environment {

  MYSQL_DB=
  # MUSQL_DB
  # prodcution
}

function test {
  local tmpfile=$(mktemp)
  trap "
    rm ${tmpfile}
    trap - RETURN
  " RETURN
  echo "Hello World" > $tmpfile
  deepl_translate $tmpfile DE


  deepl_translate -r $tmpfile DE
  # local menu=(${@:2:($#-1)})
  local args=(${@:2:($#-1)})
  echo "${args[1]}"
  # $1 "${fArgs}"
}

# test $@
