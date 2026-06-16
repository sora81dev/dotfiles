# TODO

## zshrc
- [ ] powerlevel10kの設定をNix home-managerに移行
- [ ] GitHub Verifired Commitのexportを入れる

## Nix home-manager
- [ ] zoxideの設定  
      Ref: [NixOS Search - packages - zoxide](https://search.nixos.org/packages?channel=26.05&query=zoxide)
- [ ] powerlevel10kの設定  
      Ref: [NixOS Search - packages - powerlevel10k](https://search.nixos.org/packages?channel=26.05&query=powerlevel10k)
  - [ ] NerdFonts入れる  
```nix
fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono  # おすすめのNerd Font（2026年現在の書き方）
];
```