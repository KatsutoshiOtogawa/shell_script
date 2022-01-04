package v1

// import (
// 	"runtime"
// 	"strings"
// )

// type gnu struct {
// 	Sed   string
// 	Awk   string
// 	Xargs string
// 	Find  string
// 	Date  string
// 	Cut   string
// }

// // gnu constructor. gnu type represent gnu command.
// func Gnu() *gnu {
// 	gnu := new(gnu)
// 	gnu.Sed = "sed"
// 	gnu.Awk = "awk"
// 	gnu.Xargs = "xargs"
// 	gnu.Find = "find"
// 	gnu.Date = "date"
// 	gnu.Cut = "cut"

// 	// check bsd
// 	if IsBSD() {
// 		gnu.Sed = "gsed"
// 		gnu.Awk = "gawk"
// 		gnu.Xargs = "gxargs"
// 		gnu.Find = "gfind"
// 		gnu.Date = "gdate"
// 		gnu.Cut = "gcut"
// 	}
// 	return gnu
// }

// func IsBSD() bool {
// 	judge := false
// 	goos := runtime.GOOS
// 	if strings.Contains(goos, "bsd") || goos == "darwin" {
// 		judge = true
// 	}
// 	return judge
// }
