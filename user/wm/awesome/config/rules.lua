local awful = require("awful")
local gears = require("gears")

local my_tags = require("modules.my_tags")

awful.rules.rules = gears.table.join(awful.rules.rules,
  -- Browsers
  {
    rule = { class = { "Firefox", "Vivaldi", "Chromium" } },
    properties = { tag = my_tags.get(2) }
  },

  -- Games
  {
    rule = { class = { "Steam", "Retroarch", "pcsx2-qt" } },
    properties = { tag = my_tags.get(3) }
  },

  -- Security
  {
    rule = { class = { "KeePassXC" } },
    properties = { tag = my_tags.get(5) }
  }
)
