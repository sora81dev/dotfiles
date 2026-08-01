{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./programs
    ./packages
  ];

  _module.args = { inherit inputs; };

  # Packages
  home.packages = with pkgs; [
    tree
    direnv
    platformio

    gcc
    clang-tools

    # Rust
    rustc
    cargo
    rustfmt
    tokei

    ghq

    # NodeJS
    nodejs
    pnpm

  ];

  # Enable Removable Media
  # https://wiki.nixos.org/wiki/USB_storage_devices
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.nemo-with-extensions}/bin/nemo";
      };
    };
  };
}
