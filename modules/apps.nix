{config, pkgs, ...}:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # zed-editor
    vscode-fhs
    dbeaver-bin
    netease-cloud-music-gtk
    alacritty
    wechat-uos
    telegram-desktop
    mpv
    vlc
    brave
    keepassxc
    mission-center
    jetbrains.rust-rover
    jetbrains.idea-ultimate
    wpsoffice-cn
  ];
}

        
