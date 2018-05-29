local DataType = require("classes/DataType")
local RGBColor = require("classes/RGBColor")

local ColoredText = DataType:subclass("ColoredText")

function ColoredText:init(...)
    local args = {...}

    self.data = args
end

return ColoredText
