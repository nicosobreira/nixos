{
  pkgs,
  withNvidiaOffload,
  ...
}: {
  programs.lutris = {
    enable = true;

    package = withNvidiaOffload pkgs.lutris;

    runners = {
      pcsx2 = {
        package = pkgs.pcsx2;
        settings = {
          runner.fullscreen = true;
        };
      };
    };
  };

  home.packages = with pkgs; [
    antimicrox

    (withNvidiaOffload dolphin-emu-primehack)
  ];
}
