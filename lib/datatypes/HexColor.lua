local Color = require("lib.datatypes.Color")

local HexColor = Color:subclass("HexColor")

function HexColor:init(color)
    self.color = color
end

function HexColor:out()
    local hex = self.color:gsub("#","")
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

function HexColor:outTable()
    local hex = self.color:gsub("#","")
    return {
        tonumber("0x"..hex:sub(1,2)),
        tonumber("0x"..hex:sub(3,4)),
        tonumber("0x"..hex:sub(5,6))
    }
end