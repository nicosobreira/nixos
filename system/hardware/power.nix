{...}: {
  services.power-profiles-daemon.enable = true;

  # CPU governor fallback
  powerManagement.cpuFreqGovernor = "performance";

  # Intel thermal management
  services.thermald.enable = true;
}
