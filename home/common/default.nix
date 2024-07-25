{
  config,
  pkgs,
  ...
}: {
  # ssh config
  home.file.".ssh/config.link" = {
    source = ./configs/ssh/config;
    onChange = ''
      cat ~/.ssh/config.link > ~/.ssh/config
      chmod 600 ~/.ssh/config
    '';
  };

}
