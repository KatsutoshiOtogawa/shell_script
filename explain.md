# 本当は怖いシェルスクリプト

## そのインクリメント、グローバルで共有してないか?

local i
for ((i=0))

```bash
function bbb {
  for ((i=0; i < 1111;i++)); do
    echo $i
    before=$(($i -1))
  done
}

bbb 

echo $i
echo $before
function ccc {
  echo $i
  echo $before
}
```

## localで宣言しておく。

```bash
function bbb {
  local i
  for ((i=0; i < 1111;i++)); do
    echo $i
    local before=$(($i -1))
  done
}

bbb 

echo $i

function ccc {
  echo $i
  echo $before
}
```

## そのtrapグローバルを書き換えないか？

```bash

function {
  trap 
}

```

## 対策

```bash
function {
  # 関数を抜けたら、
  trap '
    trap - SGNAL
    trap - RETURN
  ' RETURN

  # やりたい処理。.
}
```

## その処理遅くないか?

## 

パイプを使う

## その処理

```bash
awk -F, '{
  print $0
}'
```


## 前の処理のファイルが欲しい。

一時ファイルを使え
```bash
# 前の処理
t_aa=$(mktmp)

t_aa 
```

OSが定期的に削除してくれる。
容量が少なくなった時とか。再起動時とか。
何時間後とかも作成時に指定できる。
いつかは削除される。
異常終了系
INT PIPE TERM

## 

## その処理/ルート消さないか？

```bash

# ログの保存期間を過ぎたら削除
function rm_applog {
  # ログの保存期間が半年なので過ぎたやつは削除
  local
  local yearmonth=yyyymm
  local APPLOG_DIR=
  rm $APPLOG_DIR/yyyymm/*
}
```

## 実行すると

```bash
# 存在しない変数でもエラーにならない。
$APPLOG_DIR
# つまりこれと同じ意味
rm /*
```

永遠にデータがさようなら...

## 対策
存在しない変数、空の変数は異常系として関数の外にさっさと出す。
```bash
if [ -z $ ]; then
  echo '変数を設定してください' >&2
  return 1
fi
```
set -u で未定義の変数にあたったらエラーで逃げる
人もいるけど、そもそもロンとして未定義の変数や、
空の変数は異常でないという前提の作りなのでおすすめしない。

## その処理グローバル汚さないか?

## 
シェルスクリプトはダイナミックスコープ
localと宣言しておく。
localと宣言していないやつは
全て他のやつ見に行く。

## 

## その処理macとlinuxで環境違いすぎないか


# 対策
gnuのaliasを設定する関数を作ってやる。

## 

## その処理、一般ユーザーで書き換えれないか?

vimで見てそのまま
なんか編集して
癖で:wqとかやっちゃった。

lessで見たら良いのにvimで読んでデータを消す不届きものがいる。
多分割りと年配のSEとかは危険だからvimで読むなという人多いと思います。
## 対策

本番ファイルの所有者を管理者にして
読み込み権限だけ他のユーザーに与えてやる。
ベンチャー企業とかわかってても時間ないからという人は多い。

## 

```bash
# ~/.bash_profile
# experimental bash functions
if $SHELL | grep bash > /dev/null; then
  source /Volumes/APP_SSD/source/shell_script/functions/*.sh
fi
```

あたらたにbashを実行して | grep bash
そのなかでbash を実行して| grep bash
さらにbashを実行して | grep bash
...
というふうに再起的な処理ができている。
grep bash でずっと出力を待ち続ける

## 

```bash
if echo $SHELL | grep bash > /dev/null; then
  source /Volumes/APP_SSD/source/shell_script/functions/*.sh
fi
```

## 対策

ログインシェルのprofile, rcファイルに失敗するかどうかわからない処理を書かない。
rcはshellを切り替えるたびに読み込まれる。

複数のユーザーが見る処理にあまり書き込まない。
復旧用のユーザーを作成しておく。
本番サーバーがubuntuユーザーしかなくて、
そこでsudoで変更して処理してるとか。
sshのキーの方に各SEの秘密鍵を置いている。

もしトラブル起こった時はベンダーに連絡かな。


## その処理
