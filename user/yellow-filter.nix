{...}: let
  # Import local location file if it exists
  gammastepLocation = builtins.tryEval (import ./private/coordinates.nix);
in {
  services.gammastep = {
    enable = true;
    latitude =
      if gammastepLocation.success
      then gammastepLocation.value.latitude
      else null;
    longitude =
      if gammastepLocation.success
      then gammastepLocation.value.longitude
      else null;
  };
}
