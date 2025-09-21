package main

import (
	"os"

	wwfs "github.com/nnlgsakib/wwfs-node/cmd/node/wwfs"
)

func main() {
	os.Exit(wwfs.Start(wwfs.BuildDefaultEnv))
}
