package main

import (
	"os"

	"github.com/nnlgsakib/wwfs-node/cmd/ipfs/kubo"
)

func main() {
	os.Exit(kubo.Start(kubo.BuildDefaultEnv))
}
