{config, pkgs, ...}:

{

  # wechat-uos 微信需要此包
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # nixpkgs.config.brave.commandLineArgs =;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    zed-editor
    vscode-fhs
    jetbrains.rust-rover
    jetbrains.idea-ultimate
    dbeaver-bin
    netease-cloud-music-gtk
    alacritty
    wechat-uos
    telegram-desktop
    wpsoffice-cn
    mpv
    vlc
    brave
    keepassxc
    mission-center
  ];
}

        
