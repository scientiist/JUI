local UIBase = require("lib.classes.UIBase")
local Dimension = require("lib.datatypes.Dimension")
local Vector2D = require("lib.datatypes.Vector2D")

--[[
    JUIScene class
        Inherits UIBase
    
        Internal properties:
            Dimension size
            Dimension position

        Hidden methods:

        Public methods:
            Vector2D getAbsolutePosition()
            Vector2D getAbsoluteSize()

        Events:
            
]]
local JUIScene = UIBase:subclass("JUIScene")

function JUIScene:init()
    self.super:init()
    self.size = Dimension:new(1, 1)
    self.position = Dimension:new(0, 0)
end

function JUIScene:getAbsolutePosition()
    return Vector2D:new(0, 0)
end

function JUIScene:getAbsoluteSize()
    return Vector2D:new(love.graphics.getWidth(), love.graphics.getHeight())
end

function JUIScene:render()
    self.super:render()
    self:renderChildren()
end

return JUIScene