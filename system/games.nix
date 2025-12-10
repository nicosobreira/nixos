{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./games/steam.nix
    ./games/minecraft-bedrock.nix
    # ./games/retro.nix
  ];

  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  boot.blacklistedKernelModules = [
    "shawan"
    "shawan-gamepad"
    "hid_shawan"
  ];

  environment.systemPackages = with pkgs; [
    mame-tools
  ];
}
