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

  # Um entre "ignore", "poweroff", "reboot", "halt", "kexec", "suspend", "hibernate", "hybrid-sleep", "suspend-then-hibernate", "lock"
  services.logind.settings.Login = {
    HandleLidSwitch = "lock"; # Caso esteja na bateria
    HandleLidSwitchExternalPower = "lock"; # Caso esteja na tomada
    HandleLidSwitchDocked = "ignore"; # Caso outra tela esteja conectada
  };
}
