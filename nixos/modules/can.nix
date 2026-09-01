{ ... }: {
  systemd.network.enable = true;

  systemd.network.networks."25-can" = {
    matchConfig.Type = "can";
    linkConfig.RequiredForOnline = "no";
    canConfig.BitRate = "1000K";
  };
}
