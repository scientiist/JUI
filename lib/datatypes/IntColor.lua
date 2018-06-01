local DataType = require("lib.datatypes.DataType")


local RGBColor = DataType:subclass("RGBColor")

function RGBColor:init(red, green, blue)
    self.r = red or 255
    self.g = green or 255
    self.b = blue or 255
end

function RGBColor:out()
    return self.r/255, self.g/255, self.b/255
end

function RGBColor:outTable()
    return {self.r/255, self.g/255, self.b/255}
end

return RGBColor