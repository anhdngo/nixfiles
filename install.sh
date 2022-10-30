#!/bin/sh

sudo dnf install -y git
git clone https://gitlab.com/anhdngo/nixfiles ~/.config/nixpkgs
cd ~/.config/nixpkgs

make dnf

curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
rm ~/.config/user-dirs.dirs
nix-shell '<home-manager>' -A install

home-manager switch -b backup
