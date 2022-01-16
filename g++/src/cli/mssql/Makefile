



build: 
	g++ -std=c++17 -o out/example target/main.cc target/lib/example.cc -lexpect -ltcl8.6 -lboost_program_options

clean:
	rm out/example

install: build
	install ./out/example ../../../bin/

# 中間コンパイルを考えて無いので修正。
# -cで生成物を指定すると分割コンパイル
# -c で分割した後にg++で単純に連ねるとそれらでビルド
run: install
	../../../bin/example $@

uninstall: 
	rm ../../../bin/example

# sudo apt install tcl-expect-dev
# https://manpages.debian.org/stretch/tcl-expect-dev/libexpect.3.en.html
