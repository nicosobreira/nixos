{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.okular

    nautilus
    # dolphin
    # kio
    # kio-extras
    # kio-admin
  ];

  # GTK/Nautilus bookmarks
  gtk.gtk3.bookmarks = [
    "file://${config.home.homeDirectory}/Games"
    "file://${config.home.homeDirectory}/code"
  ];
}
