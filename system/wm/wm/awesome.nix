{pkgs, ...}: {
  services.xserver.windowManager.awesome = {
    enable = true;
    noArgb = true;
  };

  environment.systemPackages = with pkgs; [
    flameshot
  ];

  # For `wpctl`
  services.pipewire.enable = true;

  # For `light`
  programs.light.enable = true;
}
