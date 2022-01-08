#include "./lib/example.h"
#include "./lib/command.h"

// using cli::example::command::Invoke;
int main(const int argc, const char *argv[]){
    try {
        cli::example::command::Invoke(argc, argv);
    }catch (const boost::program_options::required_option& err) {
        return 1;
    }catch (const cli::example::command::call_undefined_function& err) {
        return 1;
    }catch(const std::exception& err) {

        return 1;
    }

    // cli::example::web::request::Invoke();

    return 0;
}

