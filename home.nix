{ config, lib, pkgs, ... }:

let
  packages = with pkgs; [
    # Essential
    zsh
    git
    pavucontrol
    rofi
    scrot
    vim
    kitty
    p7zip

    # Other
    feh
    powerline-fonts
    arandr
    xfce.thunar

    # Applications
    brave
    vscode
    obsidian
    vlc
    qbittorrent
    cryptomator
    veracrypt
    pcloud
  ];

in
{
  home = {
    username = "pokebowl";
    homeDirectory = "/home/pokebowl";
    sessionVariables = {
      EDITOR = "vim";
    };
    packages = packages;
    stateVersion = "22.05";
  };

  nixpkgs = {
    config = import ./config.nix;
  };


  home.shellAliases = {
    sl = "ls";
    l = "ls";
    ll = "ls -lahF";
    rl = "exec $SHELL -l";
    c = "clear";
    vi = "vim";
    vo = "vim";
    g = "git";
    encrypt = "7z a -p -mx=9 -mhe -t7z";

    dt = "cd ~/Desktop";
    dl = "cd ~/Downloads";
    doc = "cd ~/Documents";
    cf = "cd $DOTFILES";
  };
  
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
}
