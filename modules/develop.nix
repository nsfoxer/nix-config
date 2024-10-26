{ inputs, config, lib, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    clang
#     Replace llvmPackages with llvmPackages_X, where X is the latest LLVM version (at the time of writing, 16)
    llvmPackages.bintools
    rustup
    flutter
    protobuf
    nixpkgs-fmt
    protoc-gen-dart
    pkg-config
    dbus
    protoc-gen-prost
    openssl
    fontconfig
    freetype
  ];

  environment.variables = {
    PKG_CONFIG_PATH="${pkgs.dbus.dev}/lib/pkgconfig:${pkgs.openssl.dev}/lib/pkgconfig:${pkgs.fontconfig.dev}/lib/pkgconfig:${pkgs.freetype.dev}/lib/pkgconfig";
    FLUTTER_ROOT="${pkgs.flutter}";
  };

}
