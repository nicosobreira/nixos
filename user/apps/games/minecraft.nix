{
  pkgs,
  withNvidiaOffload,
  ...
}: {
  home.packages = with pkgs; [
    (withNvidiaOffload prismlauncher)
    # mcpelauncher-ui-qt
  ];
}
