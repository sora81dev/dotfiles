# TODO

## zshrc
- [ ] powerlevel10kの設定をNix home-managerに移行
- [ ] GitHub Verifired Commitのexportを入れる

## Nix home-manager
- [ ] zoxideの設定  
      Ref: [NixOS Search - packages - zoxide](https://search.nixos.org/packages?channel=26.05&query=zoxide)
- [ ] zshの設定
      Ref: [NixOS Search - packages - zsh](https://search.nixos.org/packages?channel=26.05&query=zsh#show=zsh)
  - [ ] zshに追記する(既存configのロード)  
```diff_nix
+ programs.zsh = {
+   enable = true;
+ 
+   initExtra = ''
+     source ~/.config/.zshrc
+   '';
+ };
```
- [ ] powerlevel10kの設定  
      Ref: [NixOS Search - packages - powerlevel10k](https://search.nixos.org/packages?channel=26.05&query=powerlevel10k)
  - [ ] zshに追記する(powerlevel10kをロード, .p10k.zshを読む)  
         Ref: [NixOS Search - packages - powerlevel10k](https://search.nixos.org/packages?channel=26.05&query=powerlevel10k)
```diff_nix
programs.zsh = {
  enable = true;
  promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  initExtra = ''
    source ~/.config/.zshrc
+     source ~/.config/.p10k.zsh
  '';
};
```
  - [ ] NerdFonts入れる  
```diff_nix
+ fonts.packages = with pkgs; [
+   nerd-fonts.jetbrains-mono
+ ];
```