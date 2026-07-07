{...}: let
  # Start and end hours
  start = 18;
  end = 9;
in {
  services.redshift = {
    enable = true;

    temperature = {
      day = 6500; # Without filter (cor "neutra")
      night = 3400; # Yellow / warm
    };

    # Format "HH:MM-HH:MM"
    duskTime = "${toString start}:00-${toString start}:05";
    dawnTime = "${toString end}:00-${toString end}:05";
  };
}
