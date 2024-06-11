{ pkgs, ... }:

{
  # 有app.nix包已启用alacritty
  home.file.".config/alacritty" = {
    source = ./config;
    recursive = true;
  };

}
