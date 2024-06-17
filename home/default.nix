{ config, pkgs, ... }:

{
  imports = [
    ./gui
    ./common
  ];

  home.username = "nsfoxer";
  home.homeDirectory = "/home/nsfoxer";

  programs = {
    # git
    git = {
      enable = true;
      userName = "nsfoxer";
      userEmail = "muwuren@gmail.com";
    };
    neovim.defaultEditor = true;
  };


  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
