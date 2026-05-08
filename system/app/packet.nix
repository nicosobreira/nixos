{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    packet
  ];

  networking.firewall = {
    allowedUDPPorts = [5353];
  };
}
