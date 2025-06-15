local gears = require("gears")
local awful = require("awful")

local BRIGHTNESS_VALUE = "10"
local AUDIO_VALUE = "3"

globalkeys = gears.table.join(
	globalkeys,
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.util.spawn("light -A " .. BRIGHTNESS_VALUE)
	end, { description = "screen brightness up", group = "control" }),

	awful.key({}, "XF86MonBrightnessDown", function()
		awful.util.spawn("light -U " .. BRIGHTNESS_VALUE)
	end, { description = "screen brightness down", group = "control" }),

	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.util.spawn("amixer set Master -M " .. AUDIO_VALUE .. "%+")
	end, { description = "raise volume", group = "control" }),

	awful.key({}, "XF86AudioLowerVolume", function()
		awful.util.spawn("amixer set Master -M " .. AUDIO_VALUE .. "%-")
	end, { description = "lower audio", group = "control" }),

	awful.key({}, "XF86AudioMute", function()
		awful.util.spawn("amixer set Master toggle")
	end, { description = "mute audio", group = "control" })
)
