package v1

import (
	"fmt"
	"os"
	"runtime"
	"strings"

	"github.com/urfave/cli/v2"
)

// represent gnu command. these command
type pandoc struct {
	Sed   string
	Awk   string
	Xargs string
	Find  string
	Date  string
	Cut   string
}

// gnu constructor. gnu type represent gnu command.
func Pandoc() *pandoc {
	gnu := new(pandoc)
	gnu.Sed = "sed"
	gnu.Awk = "awk"
	gnu.Xargs = "xargs"
	gnu.Find = "find"
	gnu.Date = "date"
	gnu.Cut = "cut"

	// check bsd
	if IsBSD() {
		gnu.Sed = "gsed"
		gnu.Awk = "gawk"
		gnu.Xargs = "gxargs"
		gnu.Find = "gfind"
		gnu.Date = "gdate"
		gnu.Cut = "gcut"
	}
	return gnu
}

// check os type return false, true
func IsBSD() bool {
	judge := false
	goos := runtime.GOOS
	if strings.Contains(goos, "bsd") || goos == "darwin" {
		judge = true
	}
	return judge
}

func Invoke() {
	var funcName string
	app := &cli.App{
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:    "pkg",
				Aliases: []string{"p"},
				Value:   "",
				Usage:   "this value doesnot use. this flag need to call from upper layer",
			},
			&cli.StringFlag{
				Name:        "func",
				Aliases:     []string{"f"},
				Value:       "",
				Usage:       "Write you want to use func name",
				Destination: &funcName,
				Required:    true,
			},
		},
		Action: func(c *cli.Context) error {
			pandoc := Pandoc()

			fmt.Print(pandoc.Awk)

			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		fmt.Print(err.Error())
	}
}
