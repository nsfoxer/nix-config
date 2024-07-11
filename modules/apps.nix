{config, pkgs, ...}:

{

  # wechat-uos 微信需要此包
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # nixpkgs.config.brave.commandLineArgs =;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = 
  let 
    config.packageOverrides = pkgs: {
      brave.override = {
        commandLineArgs = "--ozone-platform-hint=auto --ozone-platform=wayland --gtk-version=4 --enable-wayland-ime";
      };
    };
  in
   with pkgs; [
    zed-editor
    vscode-fhs
    jetbrains.rust-rover
    jetbrains.idea-ultimate
    netease-cloud-music-gtk
    alacritty
    wechat-uos
    telegram-desktop
    wpsoffice-cn
    mpv
    vlc
    brave
    keepassxc
  ];
}

        
