{pkgs, ...}: {
  documentation = {
    enable = true;
    dev.enable = true;
    man.enable = true;
  };

  environment.systemPackages = with pkgs; [
    man-pages # POSIX and Linux API manual pages (Section 2, 3)
    man-pages-posix # POSIX specific manual pages
    glibcInfo # Provides info pages and additional C library docs
  ];
}
