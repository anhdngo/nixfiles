.PHONY: all
all: nix home-manager

.PHONY: dnf
dnf:
	sudo dnf install -y $(shell grep -vE "^\s*#" ./dnf.txt | tr "\n" " ")
	pip install --user bumblebee-status

.PHONY: nix
nix:
	curl -L https://nixos.org/nix/install | sh

.PHONY: home-manager
home-manager:
	nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
	nix-channel --update
	nix-shell '<home-manager>' -A install

.PHONY: oh-my-zsh
oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm ~/.zshrc
	home-manager switch
	chsh -s /usr/bin/zsh
