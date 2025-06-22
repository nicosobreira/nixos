local textbox = require("wibox.widget.textbox")
local timer = require("gears.timer")

local battery = { mt = {} }

function battery.new()
	local widget = textbox()

	function widget._private.update()
		local str = "ABC"
		widget:set_markup(str)
		widget._timer.timeout = calc_timeout(60)
		widget._timer:again()
		return true
	end

	widget._timer = timer.weak_start_new(60, w._private.update)

	return widget
end

function battery.mt:__call(...)
	return new(...)
end

return setmetatable(battery, battery.mt)
