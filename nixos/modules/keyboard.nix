{ ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];

        settings = {
          main = {
            capslock = "layer(control)";
          };
          otherlayer = { };
        };
      };
    };
  };

  environment.variables = {
    GTK_IN_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}
