{...}: {
  fonts.fontconfig = {
    antialias = true;
    hinting = {
      enable = true;
      style = "slight"; # better for monospaced
    };
    subpixel.rgba = "rgb";
  };

  fonts.fontDir.enable = true;
}
