{ config, pkgs, ... }:

{
  imports = [
    ./gui
    ./common
  ];

  home.username = "nsfoxer";
  home.homeDirectory = "/home/nsfoxer";
  home.packages = with pkgs;[

  ];

  programs = {
    # git
    git = {
      enable = true;
      userName = "nsfoxer";
      userEmail = "muwuren@gmail.com";
    };
  };


  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
