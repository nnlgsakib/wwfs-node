//go:build !windows && nofuse
// +build !windows,nofuse

package node

import (
	"errors"

	core "github.com/nnlgsakib/wwfs-node/core"
)

func Mount(node *core.IpfsNode, fsdir, nsdir, mfsdir string) error {
	return errors.New("not compiled in")
}

func Unmount(node *core.IpfsNode) {
	return
}
