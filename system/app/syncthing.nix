{ userSettings, ... }:

let
  homeDir = ("/home/" + userSettings.username);

  dataDir = (homeDir + "/Documents");
  configDir = (homeDir + "/.config/syncthing");
in
{
  # Open ports in the firewall
  networking.firewall.allowedTCPPorts = [ 22000 21027 8384 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

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
        "nicolas" = { id = "HHZ7HL6-3CCCNLU-UHSIYC3-LZC7IXM-MKEYHVH-RREVQAA-GEAGKXD-OXU6IAA"; };
        "phone" = { id = "BAQCHX4-A3IAOHL-ZFZCTBP-S565OWO-KYINHHN-WHKTQK3-B7YGP4W-4WPFHA6"; };
        "chromebook" = { id = "TJHZ6XL-GL2JDAO-NKPWTJH-QVTQUD6-X3AZO2J-VJKCYPJ-SQKPLBK-CGWNGQO"; };
      };
      folders = {
        "Documents" = {
          # Name of folder in Syncthing, also the folder ID
          path = dataDir; # Which folder to add to Syncthing
          devices = [ "nicolas" "phone" ]; # Which devices to share the folder with
        };
        "retro" = {
          # Name of folder in Syncthing, also the folder ID
          path = (homeDir + "/Games/retro"); # Which folder to add to Syncthing
          devices = [ "nicolas" "chromebook" ]; # Which devices to share the folder with
        };
      };
    };
  };
}
