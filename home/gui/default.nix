{inputs, config, pkgs, ...}:

{
  imports = [
    ./alacritty
  ];

  home.packages = with pkgs; [
    telegram-desktop
    wpsoffice-cn
    mpv
    vlc
  ];
}
