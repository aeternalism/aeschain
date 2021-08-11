package keeper

import (
	"github.com/aeternalism/aeschain/x/aeschain/types"
)

var _ types.QueryServer = Keeper{}
