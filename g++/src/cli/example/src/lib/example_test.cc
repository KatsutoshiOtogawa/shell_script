#include <gtest/gtest.h>
#include "../include/example.h"

int main(int argc, char *argv[]) {
        ::testing::InitGoogleTest(&argc, argv);
        return RUN_ALL_TESTS();
}

namespace cli {
    namespace example {
        // TEST(Example, show) {
        //         auto example = std::unique_ptr<Example>(new Example());
        //         // ASSERT_EQ(3, example.show());
        //         // ASSERT_EQ(4, example.add(2,2));
        // }
        
        // validationのテスト
        // validationのテスト
        TEST(Example, validation) {
                auto example = std::unique_ptr<Example>(new Example());

                // check default value
                ASSERT_NO_THROW(example->Validate(std::nullopt, std::nullopt, std::nullopt));

                ASSERT_THROW(example->Validate(std::nullopt, -1, -1), assigned_wrong_value);
                ASSERT_THROW(example->Validate(std::nullopt, 0, -1), assigned_wrong_value);
                ASSERT_THROW(example->Validate(std::nullopt, -1, -0), assigned_wrong_value);
                // Threshold　value and Threshold value
                ASSERT_THROW(example->Validate(std::nullopt, 0, 0), assigned_wrong_value);

                // Threshold　value and Threshold value
                ASSERT_THROW(example->Validate(std::nullopt, 1, 0), assigned_wrong_value);
                ASSERT_THROW(example->Validate(std::nullopt, 0, 1), assigned_wrong_value);

                // correct value
                ASSERT_NO_THROW(example->Validate(std::nullopt, 1, 1));
                // ASSERT_EQ(3, example.show());
                // ASSERT_EQ(4, example.add(2,2));
        }
        // TEST(Example, get_str_foo) {
        //         auto example = std::unique_ptr<Example>(new Example());
        //         ASSERT_EQ("foo", example.get_str_foo());
        // }
        
        // TEST(Example, is) {
        //         // Example example;
        //         auto example = std::unique_ptr<Example>(new Example());
        //         ASSERT_TRUE(example.is_true ());
        //         //ASSERT_FALSE(f.is_true ());
        //         ASSERT_FALSE(example.is_false ());
        // }
        
        // TEST(Example, exception) {
        //         // Example example;
        //         auto example = std::unique_ptr<Example>(new Example());
        //         ASSERT_THROW(example.throw_exception(), std::exception);
        //         ASSERT_NO_THROW(example.no_throw_exception());
        // }

    }
}
