local DataType = require("classes/DataType")

local Event = DataType:subclass("Event")

function Event:init()
    self.super:init()
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