{pkgs, ...}:

{

  # wechat-uos 微信需要此包
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    zed-editor
    chromium
    vscode-fhs
    jetbrains.rust-rover
    netease-cloud-music-gtk
    alacritty
    wechat-uos
    telegram-desktop
    wpsoffice-cn
    mpv
    vlc
  ];
}
