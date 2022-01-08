
# -g でdebugのためのビルドにする。
# release build
# コンパイルを分割にするか考える。
build: 
	g++ -std=c++17 -g -o out/example target/main.cc target/lib/example.cc target/lib/command.cc -lboost_program_options -lpthread
# g++ -std=c++17 -o out/example target/main.cc target/lib/example.cc -lboost_program_options -lpthread
# ulimit -c unlimited

clean:
	rm out/example

install: build
	install ./out/example ../../../bin/

run: build
	./out/example
	echo "error code: ${?}"
	gdb ./out/example core

uninstall: 
	rm ../../../bin/example
