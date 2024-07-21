{
  config,
  pkgs,
  ...
}: {
  # ssh config
  home.file."config" = {
    # source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/common/configs/ssh/config";
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/common/configs/ssh/config";
  };

}
