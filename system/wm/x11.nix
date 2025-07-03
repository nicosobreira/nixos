{ ... }:

{

  imports = [
    ./awesome.nix
  ];

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
    displayManager = {
      lightdm.enable = true;
    };
  };

  services.libinput = {
    enable = true;
    touchpad.disableWhileTyping = true;
  };
}
