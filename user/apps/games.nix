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

    # Na hora da instalação, o $HOME é sobre escrito, por isso tem que fazer isso
    # (withNvidiaOffload (pkgs.dolphin-emu-primehack.overrideAttrs (old: {
    #   postInstall =
    #     (old.postInstall or "")
    #     + ''
    #       wrapProgram $out/bin/primehack \
    #         --run 'export HOME=$(getent passwd $USER | cut -d: -f6)'
    #     '';
    # })))
  ];
}
