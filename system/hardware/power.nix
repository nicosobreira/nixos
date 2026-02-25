{...}: {
  services.power-profiles-daemon.enable = true;

  # CPU governor fallback
  powerManagement.cpuFreqGovernor = "performance";

  # Intel thermal management
  services.thermald.enable = true;

  # SSD trim
  services.fstrim.enable = true;

  # services.tlp = {
  #   enable = false;
  #   settings = {
  #     CPU_SCALING_GOVERNOR_ON_AC = "schedutil";
  #     CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #
  #     CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
  #     CPU_ENERGY_PERF_POLICY_ON_BAT = "balance";
  #
  #     WIFI_PWR_ON_AC = "off";
  #     WIFI_PWR_ON_BAT = "on";
  #
  #     RUNTIME_PM_ON_AC = "auto";
  #     RUNTIME_PM_ON_BAT = "auto";
  #
  #     PCIE_ASPM_ON_AC = "default";
  #     PCIE_ASPM_ON_BAT = "powersupersave";
  #
  #     SATA_LINKPWR_ON_AC = "medium_power";
  #     SATA_LINKPWR_ON_BAT = "min_power";
  #
  #     USB_AUTOSUSPEND = 1;
  #
  #     CPU_MIN_PERF_ON_AC = 10;
  #     CPU_MAX_PERF_ON_AC = 100;
  #
  #     CPU_MIN_PERF_ON_BAT = 10;
  #     CPU_MAX_PERF_ON_BAT = 50;
  #
  #     CPU_BOOST_ON_AC = 1;
  #     CPU_BOOST_ON_BAT = 0;
  #
  #     CPU_HWP_DYN_BOOST_ON_AC = 1;
  #     CPU_HWP_DYN_BOOST_ON_BAT = 0;
  #
  #     START_CHARGE_THRESH_BAT0 = 75;
  #     STOP_CHARGE_THRESH_BAT0 = 80;
  #
  #     MEM_SLEEP_ON_AC = "deep";
  #     MEM_SLEEP_ON_BAT = "deep";
  #
  #     PLATFORM_PROFILE_ON_AC = "balanced";
  #     PLATFORM_PROFILE_ON_BAT = "low-power";
  #   };
  # };
}
