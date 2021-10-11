export CONTRACT_ADDRESS=`head -n 1 contract.txt`
export ETH_GAS=10000000
export ETH_RPC_URL="http://127.0.0.1:8545"
export ETH_KEYSTORE="$HOME/.dapp/testnet/8545/keystore"
export ETH_PASSWORD=/dev/null
export ETH_FROM=`head -n 1 $HOME/.dapp/testnet/8545/config/account`
