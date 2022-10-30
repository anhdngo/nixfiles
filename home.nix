{ config, lib, pkgs, ... }:

{
  home = {
    username = "pokebowl";
    homeDirectory = "/home/pokebowl";
    sessionVariables = {
      EDITOR = "vim";
    };
    packages = import ./packages.nix pkgs;
    stateVersion = "22.05";
    file = import ./dotfiles.nix;
  };

  nixpkgs = {
    config = import ./config.nix;
  };


  home.shellAliases = import ./aliases.nix;

  xdg = {
    userDirs = {
      enable = true;
      desktop = "\$HOME";
      documents = "\$HOME/Documents";
      download = "\$HOME/Downloads";
      music = "\$HOME/Music";
      pictures = "\$HOME/Pictures";
      videos = "\$HOME/Videos";
    };
  };

  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
}
