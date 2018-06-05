local UIRect = require("lib.classes.UIRect")

local Frame = UIRect:subclass("Frame")
--[[
    Frame class
        Inherits UIRect
    
        Internal properties:

        Hidden methods:

        Public methods:

        Events:

]]
function Frame:init()
    self.super:init()
end

function Frame:render()
    self.super:render()
    self:renderChildren()
end

return Frame