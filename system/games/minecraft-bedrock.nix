{ pkgs-unstable, ...}:

{
  environment.systemPackages = with pkgs-unstable; [
    mcpelauncher-ui-qt
  ];
}
