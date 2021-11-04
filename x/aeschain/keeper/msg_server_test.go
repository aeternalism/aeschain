package keeper_test

import (
	"context"
	"testing"

	keepertest "github.com/aeternalism/aeschain/testutil/keeper"
	"github.com/aeternalism/aeschain/x/aeschain/keeper"
	"github.com/aeternalism/aeschain/x/aeschain/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
)

func setupMsgServer(t testing.TB) (types.MsgServer, context.Context) {
	k, ctx := keepertest.AeschainKeeper(t)
	return keeper.NewMsgServerImpl(*k), sdk.WrapSDKContext(ctx)
}
