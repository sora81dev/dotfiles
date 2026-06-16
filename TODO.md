# TODO

## zshrc
- [x] powerlevel10kの設定をNix home-managerに移行
- [x] GitHub Verifired Commitのexportを入れる

## Nix home-manager
- [x] zoxideの設定  
      Ref: [NixOS Search - packages - zoxide](https://search.nixos.org/packages?channel=26.05&query=zoxide)
- [x] zshの設定
      Ref: [NixOS Search - packages - zsh](https://search.nixos.org/packages?channel=26.05&query=zsh#show=zsh)
  - [x] zshに追記する(既存configのロード)  
        (pkgsの追記不要)
```diff
+ programs.zsh = {
+   enable = true;
+ 
+   initExtra = ''
+     source ~/.config/.zshrc
+   '';
+ };
```
- [x] powerlevel10kの設定  
      Ref: [NixOS Search - packages - powerlevel10k](https://search.nixos.org/packages?channel=26.05&query=powerlevel10k)
  - [x] zshに追記する(powerlevel10kをロード, .p10k.zshを読む)  
         Ref: [NixOS Search - packages - powerlevel10k](https://search.nixos.org/packages?channel=26.05&query=powerlevel10k)
```diff
programs.zsh = {
  enable = true;
+ promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  initExtra = ''
    source ~/.config/.zshrc
+   source ~/.config/.p10k.zsh
  '';
};
```
  - [x] NerdFonts入れる  
        Ref [Fonts - NixOS Wiki](https://nixos.wiki/wiki/Fonts)
```diff
+ fonts.packages = with pkgs; [
+   nerd-fonts.jetbrains-mono
+ ];
```
