{
  description = "NixOS and Home Manager configuration of sora81dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    gazelle.url = "github:Zeus-Deus/gazelle-tui";

    zephyr = {
      url = "github:zephyrproject-rtos/zephyr/v4.4.0";
      flake = false;
    };

    zephyr-nix = {
      url = "github:nix-community/zephyr-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.zephyr.follows = "zephyr";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      zen-browser,
      gazelle,
      zephyr,
      zephyr-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        hp-notebook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./nixos/machines/hp-notebook/hardware-configuration.nix
            ./nixos/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.users.sora81dev = {
                imports = [
                  ./nixos/home/shared.nix
                  gazelle.homeModules.gazelle
                ];
              };

              home-manager.extraSpecialArgs = {
                inherit inputs;
                isNixOS = true;
              };
            }
          ];
        };
      };

      homeConfigurations."sora81dev" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        backupFileExtension = "backup";

        modules = [ ./nixos/home/shared.nix ];
        extraSpecialArgs = {
          isNixOS = false;
        };
      };
    };
}
