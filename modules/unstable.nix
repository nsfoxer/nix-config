{config, pkgs-unstable, nur, ...}:
{
  environment.systemPackages = with pkgs-unstable; [
    fsnotifier
  ];
  # environment.systemPackages = with config.nur.repos; [
  #   	rewine.wps
  # ];
}