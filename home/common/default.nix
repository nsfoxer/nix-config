{
  pkgs,
  config,
  ...
}: {
  # ssh config
  home.file.".ssh/config" = {
    source = ./configs/ssh/config;
  };

}
