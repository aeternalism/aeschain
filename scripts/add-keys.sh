#!/bin/bash
KEY=$1

# add keys
aeschaind keys mnemonic
aeschaind keys add ${KEY} --recover --keyring-backend file
