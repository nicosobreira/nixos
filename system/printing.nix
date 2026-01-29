{pkgs, ...}: {
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [hplip];

  environment.systemPackages = with pkgs; [hplip cups];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  networking.firewall = {
    allowedTCPPorts = [631 9100];
    allowedUDPPorts = [5353];
  };
}
