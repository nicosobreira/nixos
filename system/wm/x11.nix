{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 50;
    xkb = {
      layout = "br";
      variant = "abnt2";
      model = "pc105";
      options = "eurosign:e,caps:escape";
    };
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
      ];
    };
    displayManager.lightdm.enable = true;
  };
  libinput = {
    enable = true;
    touchpad.disableWhileTyping = true;
  };
}
