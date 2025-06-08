{ ... }:

{
  networking.firewall.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22000 21027 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
