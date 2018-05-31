local newclass = require("classes/YACI")

local Event = newclass("Event")

function Event:init()
    self.callbacks = {}
end

function Event:connect(newFunction)
    local num = #self.callbacks

    self.callbacks[num] = newFunction

    return num
end

function Event:disconnect(functionID)
    self.callbacks[functionID] = nil
end

function Event:call(...)
    for _, func in pairs(self.callbacks) do
        func(...)
    end
end

return Event