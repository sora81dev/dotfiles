{ pkgs, inputs, ... }: {
  home.packages = [
    inputs.gazelle.packages.${pkgs.system}.default
  ];

  programs.gazelle = {
    enable = true;
    settings = {
      theme = "solarized-light";
    };
  };
}
