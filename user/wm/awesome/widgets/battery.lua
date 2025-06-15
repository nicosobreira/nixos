local Battery = {}

function Battery.__index(_, key)
	return Battery[key]
end

function Battery.new(args)
	args = args or {}
	local self = setmetatable({}, Block)
	self.adapter = args.adapter or "BAT1"
end

return setmetatable(Battery, { __call = Battery.new })
