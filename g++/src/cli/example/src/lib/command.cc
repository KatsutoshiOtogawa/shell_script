#include <iostream>
#include <boost/program_options.hpp>
#include <memory>
#include <exception>
#include <stdexcept>
#include <optional>
#include <filesystem>
#include <thread>
#include "example.h"
#include "command.h"

namespace cli {
    namespace example {

        namespace command {
            call_undefined_function::call_undefined_function(const std::string& function_name) : std::runtime_error("call undefined function:" + function_name){
            }
            boost::program_options::options_description Describe() {
                boost::program_options::options_description opt("exapmple g++ and bootstrap");
                opt.add_options()
                    ("help,h", "show help")
                    ("func,f", boost::program_options::value<std::string>()->required(), "execute func")
                    ("debug,d", boost::program_options::value<std::string>(), "height for example class")
                    ("height", boost::program_options::value<int>(), "height for example class")
                    ("width,w", boost::program_options::value<int>(), "width for example class");
                return opt;
            }
            boost::program_options::variables_map Parse(const int argc, const char *argv[], const boost::program_options::options_description opt) {
                // assign value.
                boost::program_options::variables_map vm;
                
                const char mes[] = "command options parse parameter failed";
                try {
                    store(parse_command_line(argc, argv, opt), vm);
                    notify(vm);
                } catch (const boost::program_options::required_option &err) {
                    std::cerr << mes << std::endl
                        << err.what() << std::endl;
                    throw err;
                }
                return vm;
            }

            void Assign(const boost::program_options::variables_map& vm, std::optional<int>& height, std::optional<int>& width) {
                if (!vm["height"].empty()){
                    height = vm["height"].as<int>();
                }
                if (!vm["width"].empty()){
                    height = vm["height"].as<int>();
                }
            }

            // 非同期で処理を行う。
            // void AsyncRead() {
            //     // std::filesystem::path();
            //     // 現在のパスを取得。
            //     // std::filesystem::current_path();
            //     std::cout << std::filesystem::current_path() << std::endl;

            //     try {
            //         // futureとpromiseとthreadと
            //         // threadが終わった値を取得がpromise
            //         // 
            //         std::thread t1(do_worker1);
            //         std::thread t2(do_worker2);
            //         t1.join();
            //         t2.join();
            //     } catch (std::exception &ex) {
            //         std::cerr << ex.what() << std::endl;
            //     }
            // }

            void Invoke(const int argc, const char *argv[]) {

                auto opt = Describe();
                boost::program_options::variables_map vm;
                try {
                    vm = Parse(argc, argv, opt);
                } catch (const boost::program_options::required_option &err) {
                    throw err;
                }
                
                if( vm.count("help") ){
                    std::cout << opt << std::endl;
                    return;
                }
                // parse function name
                auto func = vm["func"].as<std::string>();

                std::unique_ptr<Example> example;
                try {
                    example = std::unique_ptr<Example>(new Example());
                }catch(const std::exception& err) {
                    const char mes[] = "can't assign memory for example class";
                    std::cerr << mes << std::endl
                            << err.what() << std::endl;
                    throw err;
                }

// ここからが実際に何を割り当てるか?
                std::optional<int> height;
                std::optional<int> width;
                
                Assign(&vm, height, width);

                // execute funtion.
                if (func == "Show") {
                    // show current value;
                    example->Show();
                } else if(func == "CalcArea") {
                    try {
                        auto area = example->CalcArea(std::nullopt, height, width);
                        std::cout << area << std::endl;
                    }catch (const boost::program_options::required_option &err) {
                        throw err;
                    }
                } else {
                    // execute not define function. thorw error.
                    auto err = call_undefined_function(func);
                    std::cerr << err.what() << std::endl;
                    throw err;
                }
            }
        }    
    }
}
