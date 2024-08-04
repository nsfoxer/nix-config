{config, pkgs-lock, nur, ...}:
{
  environment.systemPackages = with pkgs-lock; [
    # jetbrains.rust-rover
  ];
  # environment.systemPackages = with config.nur.repos; [
  #   	rewine.wps
  # ];
}