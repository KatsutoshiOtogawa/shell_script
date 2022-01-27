# 開発方針

## 関数

共通関数については
bash, zsh, gnu, bsd
どれでも動くように書くこと。

でないと依存関係やソースコードが複雑になる。

bash, zshの違いで大きいのは
配列の違い。

gnu, bsdは
awk gensub() 何回目に登場したものか
sed 上書きできるかどうか
xargs -d 区切り文字の選択
opt, opts osごとでも違う。使わない。
