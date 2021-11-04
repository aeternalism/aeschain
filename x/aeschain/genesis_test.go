package aeschain_test

import (
	"testing"

	keepertest "github.com/aeternalism/aeschain/testutil/keeper"
	"github.com/aeternalism/aeschain/x/aeschain"
	"github.com/aeternalism/aeschain/x/aeschain/types"
	"github.com/stretchr/testify/require"
)

func TestGenesis(t *testing.T) {
	genesisState := types.GenesisState{
		// this line is used by starport scaffolding # genesis/test/state
	}

	k, ctx := keepertest.AeschainKeeper(t)
	aeschain.InitGenesis(ctx, *k, genesisState)
	got := aeschain.ExportGenesis(ctx, *k)
	require.NotNil(t, got)

	// this line is used by starport scaffolding # genesis/test/assert
}
