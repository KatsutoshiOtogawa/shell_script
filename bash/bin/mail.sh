

# どこかでメールを置いておく必要がある。
# 
function send_mail {


  local file_name=data.txt
  # mail -s "タイトル" \
  #   -r from@example.com \
  #     -c cc1@example.com \
  #     -c cc2@example.com \
  #     to1@example.com \
  #     to2@example.com \
  #   -S smtp=smtp://localhost:25 < $file_name
  s-nail -s "タイトル" \
    -r vscode@localhost \
      -c vscode@localhost \
      vscoe@localhost \
    -Smta=smtp://localhost:25 \
    < $file_name
    # -d フラグでドライラン
    # env LC_ALL=C s-nail -:/ \
    #            -Sv15-compat \
    #            -Sttycharset=utf-8 -Smime-force-sendout \
    #            -Sexpandaddr=fail,-all,failinvaddr \
    #            -S mta=smtps://mylogin@exam.ple:465 -Ssmtp-auth=login \
    #            -S from=scriptreply@exam.ple \
    #            -s 'Subject to go' -a attachment_file \
    #            -Sfullnames -. \
    #            'Recipient 1 <rec1@exam.ple>' rec2@exam.ple \
    #            < content_file
    #  -S mta=test
}

# ./mailrc
# 管理者からメール
# developerへメール
# 管理者のメールだから、内容が決まっている事も多い。
function send_localmail {

  send_mail 
  # 
}
