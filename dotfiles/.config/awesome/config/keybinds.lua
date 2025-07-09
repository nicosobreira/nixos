local gears = require("gears")
local awful = require("awful")

local my_widgets = require("widgets")

local BRIGHTNESS_VALUE = "10"

globalkeys = gears.table.join(
	globalkeys,
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.util.spawn("light -A " .. BRIGHTNESS_VALUE)
	end, { description = "screen brightness up", group = "control" }),

	awful.key({}, "XF86MonBrightnessDown", function()
		awful.util.spawn("light -U " .. BRIGHTNESS_VALUE)
	end, { description = "screen brightness down", group = "control" }),

	awful.key({}, "XF86AudioRaiseVolume", my_widgets.volume.up, { description = "raise volume", group = "control" }),

	awful.key({}, "XF86AudioLowerVolume", my_widgets.volume.down, { description = "lower audio", group = "control" }),

	awful.key({}, "XF86AudioMute", my_widgets.volume.toggle, { description = "mute audio", group = "control" })
)
