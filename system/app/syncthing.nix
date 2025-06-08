{ userSettings, ... }:

let
  dataDir = ( "/home/" + userSettings.username + "/Documents" );
  configDir = ( dataDir + "/.syncthing" );
in
{
  # Open ports in the firewall
  networking.firewall.allowedTCPPorts = [ 22000 21027 8384 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  services.syncthing = {
    enable = true;
    group = "users";
    user = userSettings.username;
    inherit dataDir;
    inherit configDir;
    overrideDevices = true;  # overrides any devices added or deleted through the WebUI
    overrideFolders = true;  # overrides any folders added or deleted through the WebUI
    settings = {
      devices = {
      "device1" = { id = "DEVICE-ID-GOES-HERE"; };
      "device2" = { id = "DEVICE-ID-GOES-HERE"; };
      };
      folders = {
        "Documents" = {  # Name of folder in Syncthing, also the folder ID
          path = dataDir;  # Which folder to add to Syncthing
          devices = [ "device1" "device2" ];  # Which devices to share the folder with
        };
      };
    };
  };
}
