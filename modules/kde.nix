{pkgs, ...}:

{
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
      source-sans # 无衬线字体，不含汉字。字族名叫 Source Sans 3 和 Source Sans Pro，以及带字重的变体，加上 Source Sans 3 VF
      source-serif # 衬线字体，不含汉字。字族名叫 Source Code Pro，以及带字重的变体
      source-han-sans # 思源黑体
      source-han-serif # 思源宋体
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = true;
    fontDir.enable = true;


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

  # fcitx5 输入法设置
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        rime-data # 必须加上，否则rime不可用
        fcitx5-rime
        fcitx5-gtk
    ];
    fcitx5.waylandFrontend = true;
  };
  # 重新设置kde下的输入法环境变量
  lib.mkForce = {
    environment.variables = {
      #GTK_IM_MODULE = "fcitx";
      GTK_IM_MODULE = "wayland";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };


  hardware.bluetooth.enable = true;

}
