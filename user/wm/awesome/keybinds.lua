local gears = require("gears")
local awful = require("awful")

local BRIGHTNESS_VALUE = "15"

globalkeys = gears.table.join(
  awful.key({ }, "XF86MonBrightnessUp", function ()
      awful.util.spawn("light -A " .. BRIGHTNESS_VALUE)
    end,
    { description="screen brightness up" }
  ),

  awful.key({ }, "XF86MonBrightnessDown", function ()
      awful.util.spawn("light -U " .. BRIGHTNESS_VALUE)
    end,
    { description="screen brightness down" }
  ),
)
