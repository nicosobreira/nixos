{ pkgs, ... }:

{
  services.xserver.windowManager.awesome = {
    enable = true;
    noArgb = true;
    luaModules = with pkgs.luaPackages; [
      luarocks # is the package manager for Lua modules
    ];
  };
}
