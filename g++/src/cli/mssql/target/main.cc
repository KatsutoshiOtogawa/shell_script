
// #include <boost/version.hpp>
#include <boost/program_options.hpp>
#include <iostream>
// #include <expect.h>
#include <tcl8.6/expect.h>

using std::cout;
using std::cerr;
using boost::program_options::options_description;
using boost::program_options::value;
using boost::program_options::variables_map;

int test_telnet(){
    const int OK=99;
    char buff[128];
    const int exp_loguser = 1;
    const int exp_timeout = 3;
    int stage=10;
    const char host[] = "localhost";
    // char cmd[] = "telnet";
    char cmd[] = "uname";
    int fd=exp_spawnl(cmd,cmd,host,"23",NULL);
    if(fd<0){
        cerr << "rewreiro" << std::endl;
        return -10;
    }
    stage=20;
    if(OK!=exp_expectl(fd,exp_glob,"login:",OK,exp_end)){
        cerr << "ruewoireuwvvsdfdsfsd" << std::endl;
        return 3;
    }

    cout << "success" << std::endl;
    return 0;
}

int main(int argc, char *argv[])
{

    test_telnet();
    options_description opt("オプション");
    opt.add_options()
		("help,h", "ヘルプを表示")
		("op", value<std::string>(), "演算子の種類(add, sub)")
		("lhs,l", value<int>(), "左辺値")
		("rhs,r", value<int>(), "右辺値");

// libodb-boost-dev
    // show boost version
    // std::cout << BOOST_VERSION << "\n" // 104601
    //           << BOOST_LIB_VERSION "\n"; // 1_46_1
    return 0;
}

// int main()
// {
//     //名前空間
//     namespace py = boost::python;
//     //初期化
//     Py_Initialize();
//     //出力
//     std::cout << "Hello World! from C++ \n";

//     //Pythonのファイル(test_py.py)をインポート
//     py::object module_ns = py::import("test_py").attr("__dict__");
//     //インポートしたファイル内の関数を定義
//     py::object get_and_return = module_ns["hello_from_python"];
//     //インポートした関数を実行
//     auto return_nd_array = get_and_return();
// }
