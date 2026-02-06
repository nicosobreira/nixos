{...}: let
  latitude = builtins.tryEval (builtins.fromJSON (builtins.getEnv "GAMMA_LAT"));
  longitude = builtins.tryEval (builtins.fromJSON (builtins.getEnv "GAMMA_LON"));
in {
  services.gammastep = {
    enable = true;
    latitude = latitude;
    longitude = longitude;
  };
}
