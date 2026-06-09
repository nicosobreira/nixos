{...}: {
  # Shell integrations are done in config files
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
