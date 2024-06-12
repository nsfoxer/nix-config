{ pkgs, ... }:

{
  # 有app.nix包已启用 mpv
  home.file.".config/mpv/mpv.conf" = {
    source = ./mpv.conf;
  };
  home.file.".config/mpv/input.conf" = {
    text = ''Ctrl+q quit'';
  };
}
