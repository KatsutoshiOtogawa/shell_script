#include <exception>
#include <stdexcept>
#include "error.h"

namespace command {
    call_undefined_function::call_undefined_function(const std::string& function_name) : std::runtime_error(function_name){

    }
    call_undefined_function::call_undefined_function(const char* function_name) : std::runtime_error(function_name){

    }
}
