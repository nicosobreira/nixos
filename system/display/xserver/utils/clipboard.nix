{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    copyq
    xclip
  ];

  systemd.user.services.copyq = {
    description = "CopyQ Clipboard Manager";
    wantedBy = ["graphical-session.target"];
    serviceConfig = {
      ExecStart = "${pkgs.copyq}/bin/copyq";
      Restart = "on-failure";
    };
  };
}
