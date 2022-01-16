#include "example.h"
#include <iostream>
#include <tcl8.6/expect.h>

namespace example {
    int Example::get_width() {
        return this->width_;
    }
    int Example::get_heigth() {
        return this->height_;
    }
    void Example::Show() {
        std::cout << this->width_ << std::endl;
        std::cout << this->height_ << std::endl;
    }
    void Invoke() {

    }
}
