{...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    gc = {
      persistent = true;
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
