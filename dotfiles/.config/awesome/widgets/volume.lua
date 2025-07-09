local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")

-- Volume control using `amixer`

local function get_front_left_line(stdout)
	return stdout:match("Front Left:[^\n]*") or false
end

local function get_volume(line)
	return tonumber(line:match("%[(%d+)%%%]")) or 0
end

local function get_is_mute(line)
	if line:match("%[on%]") then
		return false
	elseif line:match("%[off%]") then
		return true
	end

	return nil
end

local M = {}

--- Default options
M.opts = {
	step = 3,
	mix_control = "Master",
	commands = {},
	current_volume = 0,
	is_mute = false,
	widget = nil,
}

function M.format()
	local mute_text = M.opts.is_mute and "M " or ""
	return string.format("%s[%d%%]", mute_text, M.opts.current_volume or 0)
end

---@param opts table
function M.setup(opts)
	opts = opts or {}
	-- utils.tables.merge(M.opts, opts)

	M.set_commands()
	M.set_attributes()

	M.widget = wibox.widget({
		text = M.format(),
		widget = wibox.widget.textbox,
		set_volume = function(self)
			self.text = M.format()
		end,
	})
	return M.widget
end

function M.set_commands()
	local control = M.opts.mix_control
	local step = M.opts.step

	M.opts.commands = {
		up = string.format("amixer set %s -M %d%%+", control, step),
		down = string.format("amixer set %s -M %d%%-", control, step),
		toggle = string.format("amixer set %s toggle", control),
		unmute = string.format("amixer set %s unmute", control),
		get = string.format("amixer get %s", control),
	}
end

function M.set_attributes(callback)
	awful.spawn.easy_async(M.opts.commands.get, function(stdout)
		local line = get_front_left_line(stdout)

		if not line then
			M.opts.current_volume = 0
			M.opts.is_mute = false
			if callback then
				callback()
			end
			return
		end

		M.opts.is_mute = get_is_mute(line)

		M.opts.current_volume = get_volume(line)

		if callback then
			callback()
		end
	end)
end

function M.update_widget()
	if M.widget and M.widget.set_volume then
		M.widget:set_volume()
	end
end

function M.unmute()
	awful.spawn(M.opts.commands.unmute)
	M.opts.is_mute = false

	M.update_widget()
end

function M.toggle()
	awful.spawn(M.opts.commands.toggle)
	M.opts.is_mute = not M.opts.is_mute

	M.update_widget()
end

function M.up()
	M.unmute()

	if M.opts.current_volume + M.opts.step > 100 then
		return
	end

	awful.spawn(M.opts.commands.up)
	M.opts.current_volume = M.opts.current_volume + M.opts.step

	M.update_widget()
end

function M.down()
	M.unmute()

	if M.opts.current_volume - M.opts.step < 0 then
		return
	end

	awful.spawn(M.opts.commands.down)
	M.opts.current_volume = M.opts.current_volume - M.opts.step

	M.update_widget()
end

if not M.opts.commands.get then
	M.set_commands()
	M.set_attributes()
end

return M
