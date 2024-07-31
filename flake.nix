{
  description = "A simple NixOS flake";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    # substituers will be appended to the default substituters when fetching packages
    # nix com    extra-substituters = [munity's cache server
    extra-substituters = [
      "https://mirror.nju.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # NixOS 官方软件源，这里使用 nixos-24.05 分支
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-lock.url = "github:NixOS/nixpkgs/8c50662509100d53229d4be607f1a3a31157fa12";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-lock, home-manager, ... }@inputs: {
    # 因此请将替换成你的主机名称
    nixosConfigurations = {
      nsfoxer-pc =  nixpkgs.lib.nixosSystem rec{
        system = "x86_64-linux";

        specialArgs = {
            # 注意每次 import 都会生成一个新的 nixpkgs 实例
            # 这里我们直接在 flake.nix 中创建实例， 再传递到其他子 modules 中使用
            # 这样能有效重用 nixpkgs 实例，避免 nixpkgs 实例泛滥。
            pkgs-lock = import nixpkgs-lock {
              # 这里递归引用了外部的 system 属性
              inherit system;
              # 为了拉取 chrome 等软件包，
              # 这里我们需要允许安装非自由软件
              config.allowUnfree = true;
            };

        };
        modules = [
          ./hosts/nixos

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs;
            home-manager.users.nsfoxer = import ./home;
          }
        ];
      };
    };

  };
}
