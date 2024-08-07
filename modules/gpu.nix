{ config, lib, pkgs, ... }:

{

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
    ];
  };
  
}
