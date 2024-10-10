# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/system.nix
    ../../modules/kde.nix
    ../../modules/apps.nix
    ../../modules/develop.nix
    ../../modules/gpu.nix
    ../../modules/game.nix
    ../../modules/lock.nix
    ./hardware-configuration.nix
  ];

  # network
  networking = {
    proxy.default = "http://192.168.1.30:7890";
  };

  i18n.defaultLocale = lib.mkForce "zh_CN.UTF-8";

  # user
  users.users = {
    nsfoxer = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      shell = pkgs.fish;
    };
  };

}

