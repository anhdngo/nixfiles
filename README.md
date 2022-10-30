# nixfiles
Nix files for use with home-manager

# Quick Install
```
sh -c "$(curl -fsSL https://gitlab.com/anhdngo/nixfiles/-/raw/master/install.sh)"
```

# Install
## Connect to Wifi
```
sudo nmcli --ask dev wifi connect [network-ssid]
```
## Install Nix Home Manager
```
curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
mv ~/.config/user-dirs.dirs ~/.config/user-dirs.dirs.bak
nix-shell '<home-manager>' -A install
```
## Apply Nixfiles
```
git clone https://gitlab.com/anhdngo/nixfiles ~/.config/nixpkgs
home-manager switch -b backup
```
