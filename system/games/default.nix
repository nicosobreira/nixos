{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./retro.nix
  ];

  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
}
