package main

import (
	"fmt"
	"os"

	gnu_v1 "github.com/KatsutoshiOtogawa/shell_script/go/src/cli/gnu/v1"
	"github.com/urfave/cli/v2"
)

func invoke() {
	var pkgName string
	app := &cli.App{
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "pkg",
				Aliases:     []string{"p"},
				Value:       "",
				Usage:       "Write you want to use pkg name",
				Required:    true,
				Destination: &pkgName,
			},
		},
		Action: func(c *cli.Context) error {

			switch pkgName {

			case "gnu":
				gnu_v1.Invoke()

			default:
				fmt.Println(pkgName, "は存在しないパッケージです。")
			}

			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		fmt.Print(err.Error())
	}
}
