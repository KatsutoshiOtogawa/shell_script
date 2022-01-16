
# CPPPATH=/g++
# if [ -z $CPPPATH ]; then
# dirnameから見て、g++がある分をパスにする。
#  CPPPATH=$(dirname )
# fi
# 分割コンパイル
# out/*
# コンパイルを分割にするか考える。
# buildでlibのところだけbuildとそれ以外もビルドと分ける。
build: 
	g++ -std=c++17 -o out/error.o -c target/lib/error.cc

clean:
	rm out/error.o

install: build
	install ./out/error.o ../../../lib/cli

uninstall:
	rm ../../../lib/cli/error.o
