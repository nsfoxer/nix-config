{ config, pkgs, ... }:

{
  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
#         waylandFrontend = true;
        addons = with pkgs; [
          # 当前需要rime-data选项，否则rime会无法使用都是
          rime-data
          fcitx5-rime
#           fcitx5-configtool
          fcitx5-chinese-addons
#           fcitx5-gtk
        ];
      };

    };
  };
}
