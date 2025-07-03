{ userSettings, ... }:

let
  homeDir = ("/home/" + userSettings.username);

  dataDir = (homeDir + "/Documents");
  configDir = (homeDir + "/.config/syncthing");
in
{
  # Open ports in the firewall
  networking.firewall.allowedTCPPorts = [
    22000
    21027
    8384
  ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];

  services.syncthing = {
    enable = true;
    user = userSettings.username;
    inherit dataDir;
    inherit configDir;
    guiAddress = "127.0.0.1:8384";
    overrideDevices = true; # overrides any devices added or deleted through the WebUI
    overrideFolders = true; # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
        "phone" = {
          id = "BAQCHX4-A3IAOHL-ZFZCTBP-S565OWO-KYINHHN-WHKTQK3-B7YGP4W-4WPFHA6";
        };
        "chromebook" = {
          id = "TJHZ6XL-GL2JDAO-NKPWTJH-QVTQUD6-X3AZO2J-VJKCYPJ-SQKPLBK-CGWNGQO";
        };
      };
      folders = {
        "Passwords" = {
          path = (dataDir + "/Passwords");
          devices = [
            "phone"
            "chromebook"
          ];
        };
        "retro" = {
          path = (homeDir + "/Games/retro");
          devices = [
            "chromebook"
          ];
        };
        "Music" = {
          path = (homeDir + "/Music");
          devices = [
            "phone"
          ];
        };
      };
    };
  };
}
