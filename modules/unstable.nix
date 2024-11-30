{config, pkgs-unstable, nur, ...}:
{
  environment.systemPackages = with pkgs-unstable; [
    fsnotifier
  ];
}
