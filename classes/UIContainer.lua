local UIBase = require("classes/UIBase")
local Dimension = require("classes/Dimension")
local Vector2D = require("classes/Vector2D")

local UIContainer = UIBase:subclass("UIContainer")

function UIContainer:init()
    self.super:init()
    self.size = Dimension:new(1, 1)
    self.position = Dimension:new(0, 0)
end

function UIContainer:getAbsolutePosition()
    return Vector2D:new(0, 0)
end

function UIContainer:render()
    self.super:render()
    self:renderChildren()
end

function UIContainer:getAbsoluteSize()
    return Vector2D:new(love.graphics.getWidth(), love.graphics.getHeight())
end

return UIContainer