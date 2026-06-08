{
  description = "Home Manager configuration of sora81dev";

  inputs = {
    # ツールを取得してくる大元のリポジトリを指定
    nixpkgs.url = "github:nix-community/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations."sora81dev" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux; # Ubuntu(64bit)の場合

      # さっきまで使っていた home.nix をここで読み込む！
      modules = [ ./home.nix ]; 
    };
  };
}
