{pkgs, ...}: {
  programs.lutris = {
    enable = true;

    package = pkgs.lutris.overrideAttrs (old: {
      postInstall =
        (old.postInstall or "")
        + ''
          rm -f $out/share/applications/net.lutris.Lutris.desktop
        '';
    });

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

    (pkgs.writeShellScriptBin "nvidia-lutris" ''
      exec nvidia-offload lutris "$@"
    '')

    (pkgs.makeDesktopItem {
      name = "lutris-nvidia";
      desktopName = "Lutris (NVIDIA)";
      exec = "nvidia-lutris %U";
      icon = "lutris";
      type = "Application";
      categories = ["Network" "Game"];
    })
  ];
}
