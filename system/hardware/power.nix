{...}: {
  powerManagement.enable = false;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
      energy_performance_preference = "power";
    };
    charger = {
      governor = "powersave";
      turbo = "auto";
      energy_performance_preference = "balance_performance";
    };
  };
}
