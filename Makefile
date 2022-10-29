.PHONY: all
all: nix home-manager

.PHONY: nix
nix:
	curl -L https://nixos.org/nix/install | sh

.PHONY: home-manager
home-manager:
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install
