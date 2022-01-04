package v1

import (
	"errors"
	"fmt"
	"os"
	"os/exec"
	"runtime"
	"strings"

	"github.com/urfave/cli/v2"
)

// represent gnu command. these command
type gnu struct {
	Sed   string
	Awk   string
	Xargs string
	Find  string
	Date  string
	Cut   string
}

// gnu constructor. gnu type represent gnu command.
func Gnu() *gnu {
	gnu := new(gnu)
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

// gnu command which wrapper
func Which(command string) ([]byte, error) {

	cmd := exec.Command("which", command)

	if cmd.ProcessState.ExitCode() != 0 {
		message := fmt.Sprintf("command %s not found", command)
		err := errors.New(message)
		return nil, err
	}
	out, err := cmd.Output()

	return out, err
}

func Invoke() error {
	var funcName string
	var pkgName string
	var command string
	app := &cli.App{
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "pkg",
				Aliases:     []string{"p"},
				Value:       "",
				Usage:       "this value doesnot use. this flag need to call from upper layer",
				Destination: &pkgName,
			},
			&cli.StringFlag{
				Name:        "func",
				Aliases:     []string{"f"},
				Value:       "",
				Usage:       "Write you want to use func name",
				Required:    true,
				Destination: &funcName,
			},
			&cli.StringFlag{
				Name:        "command",
				Aliases:     []string{"c"},
				Value:       "",
				Usage:       "function use",
				Destination: &command,
			},
		},
		Action: func(c *cli.Context) error {

			switch funcName {

			case "which":
				out, err := Which(command)
				if err != nil {
					return nil
				}

				fmt.Println(out)

			default:
				message := fmt.Sprintf("%s", "は存在しないパッケージです。")
				err := errors.New(message)
				return err
			}

			return nil
		},
	}

	err := app.Run(os.Args)
	if err != nil {
		return err
	}
	return nil
}
