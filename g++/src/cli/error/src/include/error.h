#pragma once
#include <boost/program_options.hpp>
#include <stdexcept>

namespace command {
    // namespaceでエラーの部分だけ分ける。
    class call_undefined_function : public std::runtime_error {
        public:
            call_undefined_function(const std::string& function_name);
            call_undefined_function(const char* function_name);
    };
}
