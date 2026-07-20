{...}: let
  # Start and end hours
  start = 18;
  end = 10;
in {
  services.redshift = {
    enable = true;

    temperature = {
      day = 6500; # Without filter (cor "neutra")
      night = 4000; # Yellow / warm
    };

    # Format of transition perid: "HH:MM-HH:MM"
    #                             start | end
    duskTime = "${toString start}:00-${toString start}:10";
    dawnTime = "${toString end}:00-${toString end}:10";
  };
}
