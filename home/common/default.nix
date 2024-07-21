{
  config,
  pkgs,
  ...
}: {
  # ssh config
  home.file.".ssh/config" = {
    # source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/common/configs/ssh/config";
    source = ./configs/ssh/config;
  };

}
