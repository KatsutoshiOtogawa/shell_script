#pragma once
#include <boost/program_options.hpp>
#include <stdexcept>
#include <optional>

namespace cli {
    namespace example {

        namespace web {
            
            namespace request {

                // invoke web request
                // void Invoke();
            }
        }

        namespace command {
            // namespaceでエラーの部分だけ分ける。
            class call_undefined_function : public std::runtime_error {
                public:
                    call_undefined_function(const std::string& function_name);
            };

            // describe command options
            boost::program_options::options_description Describe();
            // parse value .
            boost::program_options::variables_map Parse(const int argc, const char *argv[], const boost::program_options::options_description opt);
            // Assign value from boost program_options
            void Assign(const boost::program_options::variables_map& vm, std::optional<int>& height, std::optional<int>& width);
            // invoke Example class.
            // if 0 , other value on error occured.
            void Invoke(const int argc, const char *argv[]);
        }
    }
}

/* HEADER_COMMAND_H */
