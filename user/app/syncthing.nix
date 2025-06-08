{ userSettings, ... }:

let
  dataDir = ("/home/" + userSettings.username + "/Documents");
  configDir = (dataDir + "/.config/syncthing");
in
{
  services.syncthing = {
    enable = true;
  };
}
