local DataType = require("lib.datatypes.DataType")


local Color = DataType:subclass("Color")

function Color:init(red, green, blue)
    self.r = red or 1
    self.g = green or 1
    self.b = blue or 1
end

function Color:out()
    return self.r, self.g, self.b
end

function Color:outTable()
    return {
        self.r,
        self.g,
        self.b
    }
end

return Color