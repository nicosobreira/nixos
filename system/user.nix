{userSettings, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.username;
    extraGroups = [
      "video" # Screen light control
      "networkmanager"
      "wheel" # Enable ‘sudo’ for the user.
      "storage"
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    useUserPackages = true;
  };

  environment.localBinInPath = true;
}
