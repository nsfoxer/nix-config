{config, pkgs-unstable, nur, ...}:
{
  environment.systemPackages = with pkgs-unstable; [
    fsnotifier
    jetbrains.rust-rover
    jetbrains.idea-ultimate
  ];
  # environment.systemPackages = with config.nur.repos; [
  #   	rewine.wps
  # ];
}