TODO: add test (PaperfaxIndex.t.sol)

# [DappTools](https://github.com/dapphub/dapptools) Setup
Installs globally, so only need to do this once ever!
## Install Nix
MacOS >=10.15: `curl -L https://nixos.org/nix/install | sh -s -- --darwin-use-unencrypted-nix-store-volume`  
Other: `curl -L https://nixos.org/nix/install | sh`  
Run this or open a new shell to use Nix: `. "$HOME/.nix-profile/etc/profile.d/nix.sh"`  
### If using M1-based Macbook (2020 and later)
Install Rosetta: `/usr/sbin/softwareupdate --install-rosetta --agree-to-license`  
Add to `/etc/nix/nix.conf` e.g. `sudo mkdir /etc/nix; sudo nano /etc/nix/nix.conf` (replace `MY_USERNAME`):
```
system = x86_64-darwin
trusted-users = root <MY_USERNAME>
```
## Install dapptools
```
curl https://dapp.tools/install |sh
```
This will be a bit slow.

# DappTools Upgrade
See [duppgrade](https://github.com/rari-capital/duppgrade) (also a global install)

# Build Contracts
```
dapp build
```

# Spin up testnet
```
sh testnet.sh
```
This will write the deployed contract address to `contract.txt`.

To do both: `dapp build && sh testnet.sh`

## Contract Interaction CLI
Make sure your shell environment is set up (rerun this for every new shell and/or `sh testnet.sh` run):
```
source testenv.sh
```
and the testnet is still running.

### Write to contract
Example:
```
seth send $CONTRACT_ADDRESS "createProject(string, address, uint)" '"My Project"' '0x7e45CF56727d63429e74E7263Eb268AF845b19ff' '1'
seth send $CONTRACT_ADDRESS "setAuctionLive(bool)" "true"
seth send --value 5 $CONTRACT_ADDRESS "bid(uint)" 0
```
As different user (`sh testnet.sh` will print out 5 different test addresses):
```
env ETH_FROM=0x... seth send --value 10 $CONTRACT_ADDRESS "bid(uint)" 0
```

### Read from contract
Example:
```
seth call $CONTRACT_ADDRESS "numProjects()(uint)"
seth call $CONTRACT_ADDRESS "refunds(address)(uint)" $ETH_FROM
seth call $CONTRACT_ADDRESS "prizeAmount()(uint)"
```
