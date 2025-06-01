local my_tags = { " ", "󰖟 ", "󰺷 ", " " }
local default_tag = "nda"

local M = {}

---@param pos number
---@return string
M.get = function(pos)
  pos = pos or -1
  if pos < 1 or pos > #my_tags then
    return default_tag
  end
  return my_tags[pos]
end

---@return table
M.get_all = function()
  return my_tags
end

return M
