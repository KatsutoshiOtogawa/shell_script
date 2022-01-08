#pragma once
#include <boost/program_options.hpp>
#include <stdexcept>
#include <optional>

namespace cli {
    namespace example {
        // namespaceでエラーの部分だけ分ける。
        class assigned_wrong_value : public std::runtime_error {
            public:
                assigned_wrong_value(const std::string& variable_name, const std::string& wrong_value);
        };
        // Example values struct.
        // this struct
        typedef struct  {
            int height = 3;
            int width = 4;
        } ExampleGeometry;
        // represent shape class.
        // Example:
        //    auto example = std::unique_ptr<Example>(new Example());
        //    // Output
        //    exaple.Show()
        //    
        //    
        //    
        //    
        class Example {
            private:
                ExampleGeometry examplegeometry_;
                // set member variable for Example class.
                // Output:
                //    None
                // Returns:
                //    None
                void set_ExampleDate_(const std::optional<ExampleGeometry>& eg,const std::optional<int>& height, const std::optional<int>& width);
            public:
                // return example height
                // Output:
                //    None
                // Returns:
                //    examplegeometry_.height
                int get_height() noexcept;
                // return example width
                // Output:
                //    None
                // Returns:
                //    examplegeometry_.width
                int get_width() noexcept;
                // validate external value before setting private variable;
                // Output:
                //     if error occured, print iostream cerr.
                // Returns:
                //     if true, on abnormal value.
                // Exception:
                //     wrong_value_error
                void Validate(const std::optional<ExampleGeometry>& eg,const std::optional<int>& height, const std::optional<int>& width);
                // show class member variable
                // Output:
                //     print iostream stdout.
                // Returns:
                //     None
                void Show() noexcept;
                // calc area for Example class.
                // Output:
                //     print iostream stdout.
                // Returns:
                //     area.
                int CalcArea(const std::optional<ExampleGeometry>& eg, const std::optional<int>& height, const std::optional<int>& width);
        };

        namespace web {
            
            namespace request {

                // invoke web request
                // void Invoke();
            }
        }

        namespace command {
            // namespaceでエラーの部分だけ分ける。
            // async ファイル処理 

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

/* HEADER_EXAMPLE_H */
