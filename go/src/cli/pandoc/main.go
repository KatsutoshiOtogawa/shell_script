package main

import (
	"fmt"
	"os"

	v1 "github.com/KatsutoshiOtogawa/shell_script/go/src/cli/pandoc/v1"
)

func main() {
	err := v1.Invoke()
	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}
}
