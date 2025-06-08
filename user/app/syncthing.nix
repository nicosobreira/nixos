{ userSettings, ... }:

let
  dataDir = ("/home/" + userSettings.username + "/Documents");
  configDir = (dataDir + "/.config/syncthing");
in
{
  services.syncthing = {
    enable = true;
    group = "users";
    user = userSettings.username;
    dataDir = dataDir;
    configDir = configDir;
    overrideDevices = true;  # overrides any devices added or deleted through the WebUI
    overrideFolders = true;  # overrides any folders added or deleted through the WebUI
  };
}
