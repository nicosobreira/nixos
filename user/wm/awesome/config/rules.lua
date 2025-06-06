local awful = require("awful")
local gears = require("gears")

local my_tags = require("modules.my_tags")

awful.rules.rules = gears.table.join(awful.rules.rules,
  -- Browsers
  {
    rule = { class = { "Firefox", "Vivaldi" } },
    properties = { tag = my_tags.get(2) }
  },

  -- Games
  {
    rule = { class = { "Steam", "retroarch" } },
    properties = { tag = my_tags.get(3) }
  }
)
