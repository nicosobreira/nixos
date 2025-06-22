local awful = require("awful")

local enum_format = {
	default = 1,
	middle = 2,
}

local function format_middle()
	local pos = awful.screen.geometry
	return {
		x = pos.width * 0.2,
		y = pos.height * 0.4,
		width = pos.width * 0.8,
		height = pos.height * 0.6
	}
end

local function get_geometry(format)
	if format == enum_format.middle then
		return format_middle()
	else
		return {}
	end
end

local M = {}

---@return table menubar config
function M.new(terminal)
	local menubar = require("menubar")
	menubar.utils.terminal = terminal
	menubar.geometry = format_middle()
	menubar.show_categories = false
	return menubar
end

return M
