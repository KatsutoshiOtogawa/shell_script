# shell_script

## How to use

```bash

# directory create and copy files.
mkdir ~/functions
cp functions/* ~/functions/

# add functions 
echo '# load functions' >> ~/.bash_profile
echo ~/functions/* | xargs -n 1 -I {} echo source {} >> ~/.bash_profile
```

```bash
install 
```


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

  # rhel系の便利なやつ。
  # 開発終了 mailx
  # debian系は
  # mailutilになるがこっちの方が機能少ない。

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
