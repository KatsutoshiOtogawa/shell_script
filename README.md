# shell_script

## How to use

```bash
tcl8.6/expect.

# directory create and copy files.
mkdir ~/functions
cp functions/* ~/functions/

# add functions 
echo '# load functions' >> ~/.bash_profile
echo ~/functions/* | xargs -n 1 -I {} echo source {} >> ~/.bash_profile
```

ln -s /usr/include/python

include path追加

/usr/include/python3.9

```bash
install 
# デバッグ用のコメント
# [$(date +'%Y-%m-%dT%H:%M:%S%z')]:
```

<!-- # 共有ライブラリの作成
# gcc -shared -fPIC -o libhello.so hello.c
# gcc -shared -fPIC -o libhello.so hello.c
# https://www.koikikukan.com/archives/2016/10/27-000300.php -->
```bash
go build -o 

go build -o ../../bin/
export GOPATH=/home/vscode/
```

```bash

# https://manpages.debian.org/stretch/tcl-expect-dev/libexpect.3.en.html
# libexpected-dev/stable 1.0.0~dfsg-2 all
  # C++11/14/17 std::expected with functional-style extensions
C_INCLUDE_PATH や CPLUS_INCLUDE_PATH
# /usr/include/tl/expected.hpp

g++ -print-search-dirs | grep libraries | sed 's/libraries: //'

/usr/include/tl/expected.hpp

# apt show libexpected-dev
cpp のexpectという標準化が検討されているライブラリーのインストールになる。
/usr/include/tcl8.6/expect.h
/usr/include/tcl8.6/expect_comm.h
/usr/include/tcl8.6/expect_tcl.h

c++ のコンパイラの順番違いすぎ問題。
g++

g++ -o main main.cc `pkg-config --cflags --libs libcurl`

# gcc main.cc `pkg-config --cflags --libs libcurl` -o main
define切ってpatch 当ててるやつを
# sudo apt install tcl-expect-dev
/usr/include/tcl8.6/expect.h

		("op", value<std::string>(), "演算子の種類(add, sub)")
```

g++ -o main main.cc -lexpect -ltcl8.6 -lboost_program_options

-lexpect -ltcl8.6

cat /usr/lib/`dpkg-architecture -qDEB_HOST_MULTIARCH`/tcl8.6/tclConfig.sh

nm -g libexpect.so

locateをみるとちゃんとインストールされている。
/usr/lib/x86_64-linux-gnu/libexpect.so

```bash

npm install -g zx @types/node
npm link zx
npm install -g commander @types/commander
npm link commander
```

# script コマンド追記
  # scriptコマンド実行したときにデフォルトshellに変更される
  # メタ文字がきつい。
  # less -r でbsdでもちゃんと見れる。

https://dev.classmethod.jp/articles/using-mailx/

  # rhelもs-nail
  # https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/8/html/8.4_release_notes/deprecated-packages
  # s-nailもBSD


## zx を使うメリット

あくまでbashはいい言語だけど、プログラミング言語の便利さも
捨てがたいという方針
-> bash 書けない人はまずメリットわからない
-> pythonのfireやgolang
はプログラミング言語のライブラリーでバッチ描こうや
bashはきついからというスタートだから、またアプローチが違う。


questionsが使えるので、
楽。
curlや、apiもこちらの方が楽。
subprecessとかOSのコマンド叩かないといけないやつは
こっちの方が制御楽。


1. node fetchを使える curl, wgetに比べて楽
2. nothrowという形でreturn が0以外の異常系でもエラーを返さなくなる->コマンド側の実装に左右されなくなる。
3. set -eu, pipe fail-oがデフォルト設定。->bashでこの設定でやっているならいいかも。
4. xargs -n 1 commandとやっていたのがプロミスで全部動く。
bashの流儀に従うならこれは邪道なんですが、
プログラミング言語の文化からするとこれは正道なんですよ。

細かい事制御したいという事と、
対話形式で色々やりたいって矛盾するんですよ。
エラー起こしたらシェル止まるってあり得ないし。
bash_profileにエラーあったらそれでログインできなくなるって
怖過ぎなんで。

pwshはbashとプログラミング言語のちょうど
間ぐらいの作りになっている。
配列という概念もあるし、オブジェクトという概念もあるし、
わかりやすい形に引数をすべきというのも割と最近の考え方。

bashは1バイトが貴重な時代でなおかつ、
コマンドもどういうオプションだったらこういう意味とかの仕様を
みんなで決めないうちに作った言語なのであまりオプションの
-kだからどうたらどかはあまり考えても意味ない。


[](https://t28.dev/write-script-using-zx/)

コマンドラインパラメータのパーさー
minimist
commander

どちらか
commanderを選択

```bash
#
$ ENVIRONMENT=jworei abc rewuo
```

pythonのsubprocessよりは
高機能かつ、
直感的にかけるし、
コントロールも効く。

## fra

rust,cpp除いて速度最速golang

go.modファイルを複数管理したくない。
けれども大きなバイナリファイルを作りたくない。
全体に影響するから。
だとこれになる。
Makefileを書かされる。
(公式でこういうツールがないからね...)

モジュールの考え方が結構変わったり、
よく言えば成長途中の言語

ただ、破壊的な変更がほとんどないので、
バッチ処理にそこは向いている。

うまくいくかどうかは一番リーダーの構成力が求めれる
言語だと思う。

nodejs
破壊的な変更が多すぎる...
commonjs, es, client side
色々ありすぎる。
プログラマ側が混乱する仕様が多すぎて、
ぶっちゃけバッチに向いてないと思う。
12, 14, 16
で結構多い。
プログラミングスキルも結構求められる。
nodejs

zx
自分としてはこれ結構疑問があって、
技術的な問題何も解決してないんじゃ無いかと。
結局プログラミングスキル差や危険なソースコードかける
bash書かないといけなかったり、
非同期処理を隠蔽できてないから、async描かないとダメだったり。
もし使えるなら社内向けのWebShell実装するのに使ったりとかかな？

python
バッチやデータ処理上重要な事としては
最近dataclassが追加されて構造体ライクに
使えるようになって、値と変数の管理がかなり楽になったり、
型ヒントという型をかけるようになって
より安全に使えるようになった。

言語としての仕事はほとんど終えた感。
nodejsほどは破壊的な変更は無い。
他の言語には無いが便利なライブラリが多い。
とりあえずやってみるが、かなり簡単。
pexpect
速度が求められないバッチ処理なら結構おすすめ。
バッチ処理書いたことない人でも楽にかけると思います。

msの

今回調べてみて思ったのはbash以外はgoogleの技術に依存してる。

```golang
```


cppのフォルダ構成に迷ったら、
drogon読むのが良い。

cppの歴史からすると割と新しくて、
c++14, c++17を
Cppのプロジェクトって
C言語の遺産を使いながらcppもあるよって感じだったりして、
完全にcppになっているところって案外少なかったりします。

プロジェクトによっては
cpp で新しく追加された、
errorとかclassはnewでメモリを取得して、
配列で欲しい時は
動的に個数を指定して、newするだったり。


sizeof(char*)で動的に
free

ダブルポインタ使って云々カンヌンとか結構
要求されることが多いんですが、


新しくcppでプロジェクト作る必要がある場合は
これら必須

c++14, c++17だったら、
rustと変わらんぐらい、安全にかけるので。

Orm

```shell
# 自作コマンドへのパスを通す。
export PATH=$PATH:/workspace/gnu
export PATH=$PATH:/workspace/gnu
export PATH=$PATH:/Volumes/APP_SSD/source/shell_script/bash/bin/gnu
```

```shell
    trap "
      source $(which gnu_unalias)
      trap - RETURN
    " RETURN
```

```shell
install -D ./bash/bin/* ~/bin/
```

tar czvf bin.tar.gz ./bash/bin
tar -zxvf bin.tar.gz -C ~/bin --strip-components=1 --no-same-owner


pipenv lock -r --dev

```bash
# if [ -z $IS_LOG ]; then
#   local log_file=(date +"%Y/%m/%d.log")
#   outinfo "set engine google" >> $LOG_DIR/$log_file
# fi


# site:www.postgresql.jp/document/13
# みたいなのはどうしよう?結局queryに入る

for ((i=0;i<$#;i++)); do
  # if find --log flag from args, start debug mode.
  if [ ${new_array[$i]} = '--log' ]; then
    export IS_LOG=IS_LOG
    unset new_array[$i]
  fi
done
```

## unzip

```bash
# expand file
unzip bash_script.zip
tar -zxvf -u bash_script.tar.gz -C ~/
# expand to ~/bash

# export path 
export PATH=$PATH:$HOME/bash/bin
export PATH=$PATH:$HOME/bash/bin/build_support
export PATH=$PATH:$HOME/bash/bin/color
export PATH=$PATH:$HOME/bash/bin/gnu
export PATH=$PATH:$HOME/bash/bin/search_engine
```