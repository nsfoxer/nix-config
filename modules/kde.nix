{pkgs, ...}:

{
  # boot
#   boot = {
#     plymouth = {
#       enable = true;
#     };
#   };
  # bluetooth



  # display services
  services = {
    xserver = {
      enable = true;
    };

    displayManager = {
      sddm.enable = true;
      sddm.autoNumlock = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    libinput.enable = true;

  };

  # programs
  programs = {
    dconf = {
      enable = true;
    };

    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = true;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      sansSerif = ["Noto Sans" "Noto Color Emoji"];
      serif = ["Noto Serif" "Noto Color Emoji"];
      monospace = ["Liberation Mono" "FiraCode" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xeyes
    nvtopPackages.full
    lshw
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-rime
        fcitx5-gtk
    ];
  };

  hardware.bluetooth.enable = true;

}
