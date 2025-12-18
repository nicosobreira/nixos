{...}: {
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash.enable = true;
}
