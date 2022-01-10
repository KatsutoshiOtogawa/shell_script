
# include(FetchContent)
# FetchContent_Declare(
#   googletest
#   URL https://github.com/google/googletest/archive/609281088cfefc76f9d0ce82e1ff6c30cc3591e5.zip
# )

cmake_minimum_required(VERSION 3.14)
# required at least g++17
set(CMAKE_CXX_STANDARD 17)
project(example)

set(CLI_SOURCE
  lib/command.cc
  lib/example.cc
  lib/web.cc
)
set(private_headers
  lib/command.h
  lib/example.h
  lib/web.h
)

set(BOOST_MIN_VERSION "1.74.0")
# target_sources(

# )

find_package(Boost REQUIRED COMPONENTS
  program_options
)

find_package(Threads REQUIRED)

add_executable(
  example
  main.cc
  ${CLI_SOURCE}
)

target_link_libraries(
  example
  Threads::Threads
  ${Boost_LIBRARIES}
)

# target_compile_options(a.out PRIVATE -Wall -Wextra -pedantic)

install(TARGETS
  example
  RUNTIME DESTINATION bin
)


# # For Windows: Prevent overriding the parent project's compiler/linker settings
# set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
# FetchContent_MakeAvailable(googletest)
