{ ... }:

{
  home.file.".local/share/applications/brave-browser.desktop.link" = {
    source = ./applications/brave-browser.desktop;
    onChange = ''
      cat ~/.local/share/applications/brave-browser.desktop.link > ~/.local/share/applications/brave-browser.desktop
    '';
  };
  home.file.".local/share/applications/com.tencent.wechat.desktop.link" = {
    source = ./applications/com.tencent.wechat.desktop;
    onChange = ''
      cat ~/.local/share/applications/com.tencent.wechat.desktop.link > ~/.local/share/applications/com.tencent.wechat.desktop
    '';
  };
  home.file.".local/share/applications/code.desktop.link" = {
    source = ./applications/code.desktop;
    onChange = ''
      cat ~/.local/share/applications/code.desktop.link > ~/.local/share/applications/code.desktop
    '';
  };
  home.file.".local/share/applications/steam.desktop.link" = {
    source = ./applications/steam.desktop;
    onChange = ''
      cat ~/.local/share/applications/steam.desktop.link > ~/.local/share/applications/steam.desktop
    '';
  };}
