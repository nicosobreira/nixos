{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git

    wget
    curl
    unzip
    zip
    gnutar
    unrar
    p7zip
  ];

  services.udisks2.enable = true;
  programs.gnome-disks.enable = true;
  services.gvfs.enable = true; # Needed for Nauilus File Manager
}
