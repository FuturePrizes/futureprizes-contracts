TODO: add test (Metafunder.t.sol)

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

# Build contracts
```
dapp build
```

# Spin up testnet
```
sh testnet.sh
```
The last line printed out is the contract address.
TODO: print this into a file for the frontend to consume

To do both: `dapp build && sh testnet.sh`

## Contract Interaction CLI
Make sure your shell environment is set up (rerun this for every new shell and/or `sh testnet.sh` run):
```
source testenv.sh
```
### Read from contract
Example:
```
seth call $CONTRACT_ADDRESS "auditIdsByUser(address, uint)(uint)" $USER_ADDRESS $AUDIT_INDEX
```

### Write from contract
Example:
```
seth send $CONTRACT_ADDRESS "requestAudit(uint)" $PAPERFAX_ID
```
