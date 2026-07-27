{
  isNixOS ? false,
  ...
}:
{
  imports = [
    (if isNixOS then ./nixos.nix else ./home-manager.nix)
  ];

  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  home.username = "sora81dev";
  home.homeDirectory = "/home/sora81dev";

  xdg.configFile."nix".force = true;
  xdg.configFile."nix".source = ./../../nix;

  news.display = "silent";

  home.stateVersion = "26.05";
}
