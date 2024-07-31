{config, pkgs-lock, ...}:
{
  environment.systemPackages = with pkgs-lock; [
    jetbrains.rust-rover
  ];
}