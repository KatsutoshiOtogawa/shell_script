package main

import (
	"fmt"
	"os"

	v1 "github.com/KatsutoshiOtogawa/shell_script/go/src/gnu/v1"
	"github.com/urfave/cli/v2"
)

func main() {
	var funcName string
	app := &cli.App{
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "func",
				Value:       "",
				Usage:       "Write you want to use func name",
				Destination: &funcName,
			},
		},
		Action: func(c *cli.Context) error {
			gnu := v1.Gnu()

			fmt.Print(gnu.Awk)

			return nil
		},
	}

	app.Run(os.Args)
}
