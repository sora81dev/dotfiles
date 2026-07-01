{
  description = "NixOS and Home Manager configuration of sora81dev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      hp-notebook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/machines/hp-notebook/hardware-configuration.nix
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.sora81dev = import ./home-manager/home.nix;
          }
        ];
      };
    };
    homeConfigurations."sora81dev" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux; # Ubuntu(64bit)の場合

      modules = [ ./home-manager/home.nix ]; 
    };
  };
}
