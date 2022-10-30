pkgs: with pkgs; [
  # Essential
  #zsh
  git
  pavucontrol
  rofi
  scrot
  vim
  kitty
  p7zip
  picom

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

  # Fonts
  (pkgs.nerdfonts.override { fonts = [ "DejaVuSansMono" "DroidSansMono" "Hack" ]; })

  # Themes
  # arc-theme # doesn't work here, install with dnf
  lxappearance
]
