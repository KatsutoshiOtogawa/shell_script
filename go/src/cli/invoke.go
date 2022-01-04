package main

import (
	"errors"
	"fmt"
	"os"

	gnu_v1 "github.com/KatsutoshiOtogawa/shell_script/go/src/cli/gnu/v1"
)

func invoke() error {

	var pkgName string
	var funcName string
	// pkgName := flag.String("pkg", "", "pkgName for using package")
	// funcName := flag.String("func", "", "funcName for using package")

	for i := 0; i < len(os.Args); i++ {
		// check pkg flag
		if os.Args[i] == "-pkg" || os.Args[i] == "--pkg" || os.Args[i] == "-p" {
			// next args exists and next arg isnot flag or pipevalue, assign value.
			if i+1 < len(os.Args) && os.Args[i+1][0] != '-' {
				pkgName = os.Args[i+1]
			}
		}
		// check func flag
		if os.Args[i] == "-func" || os.Args[i] == "--func" || os.Args[i] == "-f" {
			// next args exists and next arg isnot flag or pipevalue, assign value.
			if i+1 < len(os.Args) && os.Args[i+1][0] != '-' {
				funcName = os.Args[i+1]
			}
		}
	}

	if pkgName == "" || funcName == "" {
		err := errors.New("args pkg or func not provied")
		return err
	}

	switch pkgName {

	case "gnu":
		err := gnu_v1.Invoke()
		if err != nil {
			return err
		}

	default:
		message := fmt.Sprintf("%s", "は存在しないパッケージです。")
		err := errors.New(message)
		return err
	}

	return nil
	// app := &cli.App{
	// 	Flags: []cli.Flag{
	// 		&cli.StringFlag{
	// 			Name:        "pkg",
	// 			Aliases:     []string{"p"},
	// 			Value:       "",
	// 			Usage:       "Write you want to use pkg name",
	// 			Required:    true,
	// 			Destination: &pkgName,
	// 		},
	// 		&cli.StringFlag{
	// 			Name:        "func",
	// 			Aliases:     []string{"f"},
	// 			Value:       "",
	// 			Usage:       "Write you want to use func name",
	// 			Required:    true,
	// 			Destination: &funcName,
	// 		},
	// 	},
	// 	Action: func(c *cli.Context) error {

	// 		switch pkgName {

	// 		case "gnu":
	// 			gnu_v1.Invoke()

	// 		default:
	// 			fmt.Println(pkgName, "は存在しないパッケージです。")
	// 		}

	// 		return nil
	// 	},
	// }

	// err := app.Run(os.Args)
	// if err != nil {
	// 	fmt.Print(err.Error())
	// }
}
