package main

import "fmt"

func main() {
	err := invoke()
	if err != nil {
		fmt.Println(err.Error())
	}
}
