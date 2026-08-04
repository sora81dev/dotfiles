{ ... }:
{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "swaylock";
        text = "Lock";
      }
      {
        label = "logout";
        action = "niri msg action quit --skip-confirmation";
        text = "Logout";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
      }
    ];
  };

  programs.swaylock.enable = true;
}
