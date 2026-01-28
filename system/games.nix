{pkgs, ...}: {
  imports = [
    ./games/steam.nix
    ./games/retro.nix
  ];

  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
}
