CONTRACT_NAME="FuturePrizes"
TESTNET="$HOME/.dapp/testnet/8545"
rm -rf "$TESTNET"
(
    while [ ! -f "$TESTNET/config/account" ] || [ ! -d "$TESTNET/keystore" ]; do
        sleep 1s
    done
    source testenv.sh
    echo "$CONTRACT_NAME"
    dapp create "$CONTRACT_NAME" | tail -n 1 > contract.txt
) &
dapp testnet --accounts 5
