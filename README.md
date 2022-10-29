# nixfiles
Nix files for use with home-manager

# Install
## Install Nix Home Manager
```
curl -L https://nixos.org/nix/install | sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```
## Apply Nixfiles
```
git clone https://gitlab.com/anhdngo/nixfiles ~/.config/nixpkgs
home-manager switch -b backup
```
