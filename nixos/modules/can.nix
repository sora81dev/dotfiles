{ ... }: {
  systemd.network = {
    enable = true;
    wait-online.enable = false;

    networks."25-can" = {
      matchConfig.Type = "can";
      linkConfig.RequiredForOnline = "no";
      canConfig.BitRate = "1000K";
    };
  };
}
