{ pkgs, ... }:
{
  programs.thunderbird.enable = true;

  systemd.user.services.thunderbird = {
    Unit = {
      Description = "Thunderbird";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.thunderbird}/bin/thunderbird";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
