{ inputs, config, lib, pkgs, ... }:

{
  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];

    substituters = [
      # cache mirror located in China
      # status: https://mirror.sjtu.edu.cn/
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      # status: https://mirrors.ustc.edu.cn/status/
      # "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
    builders-use-substitutes = true;
  };

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Select internationalisation properties.
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  # boot
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 7;
      timeout = 3;
    };
    kernelParams = ["quiet"];
    # 对/tmp使用randomdisk，可能会导致大型nix构建失败。如果构建失败，则关闭此选项
    tmp.useTmpfs = true;
  };

  # network
  networking = {
    hostName = lib.mkDefault "nsfoxer-pc";
    networkmanager.enable = true;
    # proxy.default = "http://192.168.10.34:7890";
    proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    firewall = lib.mkDefault {
      enable = false;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    sysstat
    lm_sensors # for `sensors` command
    neofetch
    htop
    btop
    nix-output-monitor # nix build 输出格式化
  ];

  environment = {
    variables = {
      DITOR = "neovim";
    };
  };

  # program
  programs = {
    fish = {
      enable = true;
    };
  };

  services = {
    locate.enable = true;
    netdata = {
      enable = false;
      python.enable = false;
      configText = builtins.readFile(./conf/netdata.conf);
    };
  };


  zramSwap.enable = true;

  # NOTE Don't change it !!!
  system.stateVersion = "24.11";
}
