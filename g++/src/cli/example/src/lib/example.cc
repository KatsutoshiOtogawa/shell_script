#include <iostream>
#include <boost/program_options.hpp>
#include <boost/beast.hpp>
#include <boost/asio/connect.hpp>
#include <boost/asio/ip/tcp.hpp>
#include <memory>
#include <exception>
#include <stdexcept>
#include <optional>
#include <thread>
#include "example.h"

namespace cli {
    namespace example {

        assigned_wrong_value::assigned_wrong_value(const std::string& variable_name, const std::string& wrong_value) : std::runtime_error("assigned_wrong_value:" + variable_name + ":" + wrong_value){
        }
        int Example::get_width() noexcept {
            return this->examplegeometry_.width;
        }
        int Example::get_height() noexcept {
            return this->examplegeometry_.height;
        }

        void Example::set_ExampleDate_(const std::optional<ExampleGeometry>& eg, const std::optional<int>& height, const std::optional<int>& width) {
            if (eg.has_value()) {
                this->examplegeometry_ = eg.value();
            }
            if (height.has_value()) {
                this->examplegeometry_.height = height.value();
            }
            if (width.has_value()) {
                this->examplegeometry_.width = width.value();
            }
        }

        void Example::Validate(const std::optional<ExampleGeometry>& eg,const std::optional<int>& height, const std::optional<int>& width) {
            if (eg.has_value()) {
                auto aaa = eg.value();
                // 構造体の値をprintできるやつ。
                auto err = assigned_wrong_value("ExampleGeometry","");
                std::cerr << err.what();
                throw err;
            }
            if (height.has_value()) {
                auto aaa = height.value();
                if (aaa <= 0){
                    auto err = assigned_wrong_value(std::string("height"), std::to_string(aaa));
                    std::cerr << err.what();
                    throw err;
                }
            }
            if (width.has_value()) {
                auto aaa = width.value();
                if (aaa <= 0){
                    auto err = assigned_wrong_value(std::string("width"), std::to_string(aaa));
                    std::cerr << err.what();
                    throw err;
                }
            }
        }
        void Example::Show() noexcept {
            std::cout << this->examplegeometry_.width << std::endl;
            std::cout << this->examplegeometry_.height << std::endl;
        }

        int Example::CalcArea(const std::optional<ExampleGeometry>& eg, const std::optional<int>& height, const std::optional<int>& width) {
            try {
                this->Validate(eg, height, width);
            } catch (const boost::program_options::required_option &err) {
                const char mes[] = "Calc Area error.";
                std::cerr << mes << std::endl;
                throw err;
            }
            this->set_ExampleDate_(eg, height, width);
            return this->examplegeometry_.height * this->examplegeometry_.width;
        }

    }
}
