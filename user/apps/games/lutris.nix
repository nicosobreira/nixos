{
  pkgs,
  withNvidiaOffload,
  ...
}: {
  programs.lutris = {
    enable = true;

    package = withNvidiaOffload pkgs.lutris;
  };

  home.packages = with pkgs; [
    antimicrox
  ];
}
