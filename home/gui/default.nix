{inputs, config, pkgs, ...}:

{
  imports = [
    ./alacritty
    ./firefox
  ];

  home.packages = with pkgs; [
    telegram-desktop
    wpsoffice-cn
    mpv
    vlc
  ];
}
